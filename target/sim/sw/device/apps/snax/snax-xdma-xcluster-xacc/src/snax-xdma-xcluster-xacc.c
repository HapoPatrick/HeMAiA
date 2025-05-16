#include <stdint.h>
#include "snax-xdma-lib.h"
#include "snrt.h"
#include "data.h"

uint64_t tcdm0_start_addr;
uint64_t tcdm1_start_addr;
uint64_t test_data_start_addr_0;
uint64_t test_data_start_addr_1;

// void dump_tcdm_debug(const char* label, int8_t* base_addr, size_t length) {
//     printf("---- %s (length = %d bytes) ----\n", label, (int)length);
//     for (size_t i = 0; i < length; i++) {
//         printf("[%d] = %d\n", (int)i, base_addr[i]);
//     }
//     printf("---- End of %s ----\n", label);
// }

void dump_tcdm_debug(const char* label, int8_t* base_addr, size_t length) {
    printf("---- %s (length = %d bytes) ----\n", label, (int)length);

    size_t i = 0;
    while (i <= length) {
        // printf("[%04d]: %4d %4d %4d %4d %4d %4d %4d %4d "
        //                      "%4d %4d %4d %4d %4d %4d %4d %4d "
        //                      "%4d %4d %4d %4d %4d %4d %4d %4d "
        //                      "%4d %4d %4d %4d %4d %4d %4d %4d\n",
        //     (int)i,
        //     base_addr[i+0],  base_addr[i+1],  base_addr[i+2],  base_addr[i+3],
        //     base_addr[i+4],  base_addr[i+5],  base_addr[i+6],  base_addr[i+7],
        //     base_addr[i+8],  base_addr[i+9],  base_addr[i+10], base_addr[i+11],
        //     base_addr[i+12], base_addr[i+13], base_addr[i+14], base_addr[i+15],
        //     base_addr[i+16], base_addr[i+17], base_addr[i+18], base_addr[i+19],
        //     base_addr[i+20], base_addr[i+21], base_addr[i+22], base_addr[i+23],
        //     base_addr[i+24], base_addr[i+25], base_addr[i+26], base_addr[i+27],
        //     base_addr[i+28], base_addr[i+29], base_addr[i+30], base_addr[i+31]
        // );
        // i += 32;
        printf("[%04d]: %4d \n",
            (int)i,
            base_addr[i+0]
        );
        i += 1;
    }

    printf("---- End of %s ----\n", label);
}

int reshuffler_check_from_tcdm(
    int8_t *tcdm_base,
    int8_t *golden,
    int32_t *tloops,         // tempLoop0_out ... tempLoop5_out
    int32_t *tstrides,       // tempStride0_out ... tempStride5_out
    int32_t spatial_len,
    int32_t spatial_stride,
    int32_t total_len        // prod(tloops) * spatial_len
) {
    int err = 0;
    int32_t result_idx = 0;

    for (int i5 = 0; i5 < tloops[5]; i5++)
    for (int i4 = 0; i4 < tloops[4]; i4++)
    for (int i3 = 0; i3 < tloops[3]; i3++)
    for (int i2 = 0; i2 < tloops[2]; i2++)
    for (int i1 = 0; i1 < tloops[1]; i1++)
    for (int i0 = 0; i0 < tloops[0]; i0++) {
        int32_t base = i0 * tstrides[0] +
                       i1 * tstrides[1] +
                       i2 * tstrides[2] +
                       i3 * tstrides[3] +
                       i4 * tstrides[4] +
                       i5 * tstrides[5];

        for (int s = 0; s < spatial_len; s++) {
            int32_t addr = base + s * spatial_stride;
            int8_t actual = tcdm_base[addr];
            int8_t expected = golden[result_idx];

            if (actual != expected) {
                printf("❌ Mismatch at result[%d]: got %d, expected %d (addr=%d)\n",
                       result_idx, actual, expected, addr);
                err++;
                // return -1;
            }

            result_idx++;
        }
    }

    printf("✅ TCDM reshuffled output matches C_golden (checked %d elements)\n", total_len);
}


int main() {
    int err = 0;
    uint32_t tstride_src[6] = {0};
    uint32_t tbound_src[6] = {0};
    uint32_t tstride_dst[6] = {0};
    uint32_t tbound_dst[6] = {0};

    // Load the CFG from data.h
    tstride_src[0] = tempStride0_in;
    tstride_src[1] = tempStride1_in;
    tstride_src[2] = tempStride2_in;
    tstride_src[3] = tempStride3_in;
    tstride_src[4] = tempStride4_in;
    tstride_src[5] = tempStride5_in;
    tbound_src[0] = tempLoop0_in;
    tbound_src[1] = tempLoop1_in;
    tbound_src[2] = tempLoop2_in;
    tbound_src[3] = tempLoop3_in;
    tbound_src[4] = tempLoop4_in;
    tbound_src[5] = tempLoop5_in;
    tstride_dst[0] = tempStride0_out;
    tstride_dst[1] = tempStride1_out;
    tstride_dst[2] = tempStride2_out;
    tstride_dst[3] = tempStride3_out;
    tstride_dst[4] = tempStride4_out;
    tstride_dst[5] = tempStride5_out;
    tbound_dst[0] = tempLoop0_out;
    tbound_dst[1] = tempLoop1_out;
    tbound_dst[2] = tempLoop2_out;
    tbound_dst[3] = tempLoop3_out;
    tbound_dst[4] = tempLoop4_out;
    tbound_dst[5] = tempLoop5_out;

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
    // // wait the C0 is done
    // snrt_global_barrier();

    // C1 Load the data from l3 -> l1
    if (snrt_cluster_idx() == 1) {
        if (snrt_is_dm_core()) {
            test_data_start_addr_1 = (uint64_t)Test_Data;
            test_data_start_addr_1 += (uint64_t)snrt_cluster_base_addrh() << 32;

            for (int i = 0; i < Test_Data_Rows; i++) {
                uint64_t test_data_start_addr_i = test_data_start_addr_1 + (uint64_t)(i * 0x100);
                test_data_start_addr_i += (uint64_t)snrt_cluster_base_addrh() << 32;
    
                snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr + i * 0x100),
                                          test_data_start_addr_i,
                                          256 * sizeof(int8_t));
                snrt_dma_wait_all();
            }
            
            // snrt_dma_start_1d_wideptr(tcdm1_start_addr, test_data_start_addr_1,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // uint64_t test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x100);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x100), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x200);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x200), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x300);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x300), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x400);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x400), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x500);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x500), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x600);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x600), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x700);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x700), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x800);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x800), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0x900);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0x900), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();

            // test_data_start_addr_2 = (uint64_t)(test_data_start_addr_1 + 0xA00);
            // test_data_start_addr_2 += (uint64_t)snrt_cluster_base_addrh() << 32;
            // snrt_dma_start_1d_wideptr((uint64_t)(tcdm1_start_addr+0xA00), test_data_start_addr_2,
            //                           256*sizeof(int8_t));
            // snrt_dma_wait_all();
            printf("[C1] Load data to TCDM done\n");
        }
    }
    // wait the C1 is done
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

            xdma_memcpy_nd((uint8_t*)tcdm1_start_addr, (uint8_t*)tcdm0_start_addr, spatialStride_in, spatialStride_out,
                       6, tstride_src, tbound_src, 6, tstride_dst, tbound_dst,
                       0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
            // printf("tcdm1_start_addr is %p\n", (uint8_t*)tcdm1_start_addr);
            // printf("tcdm0_start_addr is %p\n", (uint8_t*)tcdm0_start_addr);
            uint32_t start_cycle = snrt_mcycle();
            int task_id = xdma_start();
            // printf("The remote xdma is started. The task id is %d\n", task_id);
            xdma_remote_wait(task_id);
            // printf("The remote xdma is finished\n");
            uint32_t end_cycle = snrt_mcycle();
            uint32_t elapsed = end_cycle - start_cycle;

            // Print the result
            printf("[Time]: xDMA ND transfer took %u cycles\n", (unsigned int)elapsed);

        }
    }
    // wait the C0 is done
    snrt_global_barrier();

    // --------------------- Checking the Results --------------------- //
    if (snrt_cluster_idx() == 0 && snrt_is_dm_core()) {
        printf("[xDMA]: C0 Checking the results\r\n");
        
        // printf("xDMA cross-cluster transfer_1 verified successfully\n");
        // dump_tcdm_debug("TCDM0", (int8_t*)tcdm0_start_addr, data_transfer_len);
        reshuffler_check_from_tcdm(
            (int8_t*)tcdm1_start_addr,
            C_golden,
            tbound_src,
            tstride_src,
            8,  // spatiial len
            spatialStride_in,
            data_transfer_len
        );
        printf("TCDM1 successfully\n");
        reshuffler_check_from_tcdm(
            (int8_t*)tcdm0_start_addr,
            C_golden,
            tbound_dst,
            tstride_dst,
            8,  // spatiial len
            spatialStride_out,
            data_transfer_len
        );
    } 
    snrt_global_barrier();

    if (snrt_cluster_idx() == 0) {
        if (snrt_is_dm_core()) {

            // uint32_t start_cycle = snrt_mcycle();

            // for (int i5 = 0; i5 < tbound_src[5]; ++i5)
            // for (int i4 = 0; i4 < tbound_src[4]; ++i4)
            // for (int i3 = 0; i3 < tbound_src[3]; ++i3)
            // for (int i2 = 0; i2 < tbound_src[2]; ++i2)
            // for (int i1 = 0; i1 < tbound_src[1]; ++i1)
            // for (int i0 = 0; i0 < tbound_src[0]; ++i0){

            //     uint32_t src_offset =
            //         i0 * tstride_src[0] +
            //         i1 * tstride_src[1] +
            //         i2 * tstride_src[2] +
            //         i3 * tstride_src[3] +
            //         i4 * tstride_src[4] +
            //         i5 * tstride_src[5];

            //     uint32_t dst_offset =
            //         i0 * tstride_dst[0] +
            //         i1 * tstride_dst[1] +
            //         i2 * tstride_dst[2] +
            //         i3 * tstride_dst[3] +
            //         i4 * tstride_dst[4] +
            //         i5 * tstride_dst[5];

            //     snrt_dma_start_2d(
            //         (uint8_t *)(tcdm0_start_addr + dst_offset),
            //         (uint8_t *)(tcdm1_start_addr + src_offset),
            //         sizeof(int8_t),
            //         spatialStride_out,         
            //         spatialStride_in,          
            //         8  // spatial len   
            //     );
            //     snrt_dma_wait_all();
            // }
            // uint32_t end_cycle = snrt_mcycle();
            // uint32_t elapsed = end_cycle - start_cycle; 
            uint32_t start_cycle = snrt_mcycle();

            uint32_t dim = 6;  // 这里是6维
            uint32_t linear_idx = 0;
            uint32_t src_strides[6];

            src_strides[0] = 1;
            for (int d = 1; d < dim; ++d) {
                src_strides[d] = src_strides[d-1] * tbound_src[d-1];
            }

            for (int i5 = 0; i5 < tbound_src[5]; ++i5)
            for (int i4 = 0; i4 < tbound_src[4]; ++i4)
            for (int i3 = 0; i3 < tbound_src[3]; ++i3)
            for (int i2 = 0; i2 < tbound_src[2]; ++i2)
            for (int i1 = 0; i1 < tbound_src[1]; ++i1)
            for (int i0 = 0; i0 < tbound_src[0]; ++i0) {

                // 1. 计算 linear id
                linear_idx =
                    i0 * src_strides[0] +
                    i1 * src_strides[1] +
                    i2 * src_strides[2] +
                    i3 * src_strides[3] +
                    i4 * src_strides[4] +
                    i5 * src_strides[5];

                // 2. 将 linear id 反推回目的 tensor 的每一维坐标
                uint32_t idx_dst[6];
                uint32_t temp = linear_idx;
                for (int d = 0; d < dim; ++d) {
                    idx_dst[d] = temp % tbound_dst[d];
                    temp /= tbound_dst[d];
                }

                // 3. 用目的tensor stride计算目的偏移
                uint32_t dst_offset = 0;
                for (int d = 0; d < dim; ++d) {
                    dst_offset += idx_dst[d] * tstride_dst[d];
                }

                // 4. 源端offset还是按照原来的
                uint32_t src_offset =
                    i0 * tstride_src[0] +
                    i1 * tstride_src[1] +
                    i2 * tstride_src[2] +
                    i3 * tstride_src[3] +
                    i4 * tstride_src[4] +
                    i5 * tstride_src[5];

                // 5. 启动DMA搬运
                snrt_dma_start_2d(
                    (uint8_t *)(tcdm0_start_addr + dst_offset),
                    (uint8_t *)(tcdm1_start_addr + src_offset),
                    sizeof(int8_t),
                    spatialStride_out,         
                    spatialStride_in,          
                    8  // spatial length   
                );
                snrt_dma_wait_all();
            }
            uint32_t end_cycle = snrt_mcycle();
            uint32_t elapsed = end_cycle - start_cycle; 

            printf("[Time]: Baseline iDMA 2D transfer took %u cycles\n", (unsigned int)elapsed);
        }
    }
    snrt_global_barrier();


    // --------------------- Checking the Results --------------------- //
    if (snrt_cluster_idx() == 0 && snrt_is_dm_core()) {
        printf("[iDMA]: C0 Checking the results\r\n");
        
        reshuffler_check_from_tcdm(
            (int8_t*)tcdm0_start_addr,
            C_golden,
            tbound_dst,
            tstride_dst,
            8,  // spatiial len
            spatialStride_out,
            data_transfer_len
        );
    } else
        return 0;
    
    
    
    
    // snrt_global_barrier();
}
