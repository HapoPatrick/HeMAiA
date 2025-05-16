#include <stdint.h>
#include "snax-xdma-lib.h"
#include "snrt.h"
#include "data.h"


uint64_t tcdm0_start_addr;
uint64_t tcdm1_start_addr;
uint64_t test_data_start_addr_0;
uint64_t test_data_start_addr_1;

int main() {
    int err = 0;
    // size_t dma_transfer_size = 0xF000;  // 16kB
    // size_t dma_transfer_offset = 0x2000;

    if (snrt_cluster_idx() == 0) {
        if (snrt_is_dm_core()) {
            tcdm0_start_addr = (uint64_t)snrt_cluster_base_addrl();
            tcdm0_start_addr += (uint64_t)snrt_cluster_base_addrh() << 32;
            // printf("The C0 TCDM ADDR is %p%p \r\n",
            //        (uint8_t*)(tcdm0_start_addr >> 32),
            //        (uint8_t*)tcdm0_start_addr);
        }
    }
    snrt_global_barrier();

    if (snrt_cluster_idx() == 1) {
        if (snrt_is_dm_core()) {
            tcdm1_start_addr = (uint64_t)snrt_cluster_base_addrl();
            tcdm1_start_addr += (uint64_t)snrt_cluster_base_addrh() << 32;
            // printf("The C1 TCDM ADDR is %p%p \r\n",
            //        (uint8_t*)(tcdm1_start_addr >> 32),
            //        (uint8_t*)tcdm1_start_addr);
        }
    }
    snrt_global_barrier();

    // // C0 Load the data from l3 -> l1
    // if (snrt_cluster_idx() == 0) {
    //     if (snrt_is_dm_core()) {
    //         test_data_start_addr_0 = (uint64_t)test_data_0;
    //         test_data_start_addr_0 += (uint64_t)snrt_cluster_base_addrh() << 32;
    //         printf("[C0] Start to load data from %p%p \r\n",
    //                (uint8_t*)(test_data_start_addr_0 >> 32),
    //                (uint8_t*)test_data_start_addr_0);
    //         snrt_dma_start_1d_wideptr(tcdm0_start_addr, test_data_start_addr_0,
    //                                   TEST_DATA_SIZE);
    //         snrt_dma_wait_all();
    //     }
    // }
    // wait the C0 is done
    snrt_global_barrier();

    // C1 Load the data from l3 -> l1
    if (snrt_cluster_idx() == 1) {
        if (snrt_is_dm_core()) {
            test_data_start_addr_1 = (uint64_t)Test_Data;
            test_data_start_addr_1 += (uint64_t)snrt_cluster_base_addrh() << 32;
            printf("[C1] Start to load data from %p%p \r\n",
                   (uint8_t*)(test_data_start_addr_1 >> 32),
                   (uint8_t*)test_data_start_addr_1);
            snrt_dma_start_1d_wideptr(tcdm1_start_addr, test_data_start_addr_1,
                                      Test_Data_Len);
            snrt_dma_wait_all();
        }
    }
    // wait the C0 is done
    snrt_global_barrier();

    // Thenc C0 fetches data from C1
    if (snrt_cluster_idx() == 0) {
        if (snrt_is_dm_core()) {
            printf("[C0] Start to load data from %p%p \r\n",
                   (uint8_t*)(tcdm1_start_addr >> 32),
                   (uint8_t*)tcdm1_start_addr);

            if (xdma_disable_dst_ext(0) != 0) {
                printf("Error in disabling xdma extension 0\n");
                err++;
            } else {
                printf("The xdma extension 0 is disabled\n");
            }
    
            if (xdma_disable_dst_ext(1) != 0) {
                printf("Error in disabling xdma extension 1\n");
                err++;
            } else {
                printf("The xdma extension 1 is disabled\n");
            }
    
            if (xdma_disable_dst_ext(2) != 0) {
                printf("Error in disabling xdma extension 2\n");
                err++;
            } else {
                printf("The xdma extension 2 is disabled\n");
            }
            // uint32_t start_cycle = snrt_mcycle();
            xdma_memcpy_1d((uint8_t*)tcdm1_start_addr, (uint8_t*)tcdm0_start_addr, data_transfer_len* sizeof(int8_t));
            
            // printf("tcdm1_start_addr is %p\n", (uint8_t*)tcdm1_start_addr);
            // printf("tcdm0_start_addr is %p\n", (uint8_t*)tcdm0_start_addr);
            uint32_t start_cycle = snrt_mcycle();
            int task_id = xdma_start();
            // printf("The remote xdma is started. The task id is %d\n", task_id);
            xdma_remote_wait(task_id);
            uint32_t end_cycle = snrt_mcycle();
            uint32_t elapsed = end_cycle - start_cycle;

            printf("[Time]: xDMA ND transfer took %u cycles\n", (unsigned int)elapsed);

        }
    }
    // wait the C0 is done
    snrt_global_barrier();

    if (snrt_cluster_idx() == 0) {
        if (snrt_is_dm_core()) {

            uint32_t start_cycle = snrt_mcycle();

                snrt_dma_start_1d(
                    (uint8_t *)(tcdm0_start_addr),
                    (uint8_t *)(tcdm1_start_addr),
                    data_transfer_len*sizeof(int8_t)   
                );
                snrt_dma_wait_all();
            
            uint32_t end_cycle = snrt_mcycle();
            uint32_t elapsed = end_cycle - start_cycle;
            printf("[Time]: Baseline iDMA 1D transfer took %u cycles\n", (unsigned int)elapsed);
        }
    }
    snrt_global_barrier();

    // Start to check
    if (snrt_cluster_idx() == 0 && snrt_is_dm_core()) {
        printf("C0 Checking the results\r\n");
        for (int i = 0; i < data_transfer_len; i++) {
            if (((int8_t*)tcdm0_start_addr)[i] != Test_Data[i]) {
                err++;
                printf("C0 data is incorrect!\r\n");
                printf("tcdm0[%d]=%d, test_data_1[%d]=%d\r\n", i,
                       ((int8_t*)tcdm0_start_addr)[i], i, Test_Data[i]);
                return -1;
            }
        }
        printf("xDMA cross-cluster transfer_1 verified successfully\n");
    } else
        return 0;
    
    // snrt_global_barrier();


    // // 2nd transfer: Thenc C0 fetches data from C1
    // if (snrt_cluster_idx() == 0) {
    //     if (snrt_is_dm_core()) {
    //         printf("[C0] Start to load data from %p%p \r\n",
    //                (uint8_t*)(tcdm1_start_addr >> 32),
    //                (uint8_t*)tcdm1_start_addr);

    //         if (xdma_disable_dst_ext(0) != 0) {
    //             printf("Error in disabling xdma extension 0\n");
    //             err++;
    //         } else {
    //             printf("The xdma extension 0 is disabled\n");
    //         }
    
    //         if (xdma_disable_dst_ext(1) != 0) {
    //             printf("Error in disabling xdma extension 1\n");
    //             err++;
    //         } else {
    //             printf("The xdma extension 1 is disabled\n");
    //         }
    
    //         if (xdma_disable_dst_ext(2) != 0) {
    //             printf("Error in disabling xdma extension 2\n");
    //             err++;
    //         } else {
    //             printf("The xdma extension 2 is disabled\n");
    //         }
        
    //         xdma_memcpy_1d((uint8_t*)(tcdm1_start_addr+dma_transfer_offset), (uint8_t*)(tcdm0_start_addr+dma_transfer_offset), data_transfer_len* sizeof(uint8_t));
    //         printf("tcdm1_start_addr is %p\n", (uint8_t*)(tcdm1_start_addr+dma_transfer_offset));
    //         printf("tcdm0_start_addr is %p\n", (uint8_t*)(tcdm0_start_addr+dma_transfer_offset));

    //         int task_id = xdma_start();
    //         printf("The remote xdma is started. The task id is %d\n", task_id);
    //         xdma_remote_wait(task_id);
    //         printf("The remote xdma is finished\n");
    //     }
    // }
    // // wait the C0 is done
    // snrt_global_barrier();

    // // Start to check
    // if (snrt_cluster_idx() == 0 && snrt_is_dm_core()) {
    //     printf("C0 Checking the results\r\n");
    //     for (int i = dma_transfer_offset; i < data_transfer_len+dma_transfer_offset; i++) {
    //         if (((uint8_t*)tcdm0_start_addr)[i] != test_data_1[i]) {
    //             err++;
    //             printf("C0 data is incorrect!\r\n");
    //             printf("tcdm0[%d]=%d, test_data_1[%d]=%d\r\n", i,
    //                    ((int8_t*)tcdm0_start_addr)[i], i, test_data_1[i]);
    //             return -1;
    //         }
    //     }
    //     printf("xDMA cross-cluster transfer_2 verified successfully\n");
    // } else
    //     return 0;
}


    // xdma_memcpy_1d((uint8_t*)tcdm1_start_addr, (uint8_t*)tcdm0_start_addr, data_transfer_len* sizeof(int8_t));
    
    // uint32_t start_cycle = snrt_mcycle();

    // int task_id = xdma_start();
    // xdma_remote_wait(task_id);

    // uint32_t end_cycle = snrt_mcycle();
    // uint32_t elapsed = end_cycle - start_cycle;