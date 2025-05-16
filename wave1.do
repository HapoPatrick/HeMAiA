onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/i_snax_KUL_cluster_xdma/xdmaCtrl/io_remoteXDMACfg_fromRemote_bits
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/i_snax_KUL_cluster_xdma/xdmaCtrl/io_remoteXDMACfg_fromRemote_ready
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/i_snax_KUL_cluster_xdma/xdmaCtrl/io_remoteXDMACfg_fromRemote_valid
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/i_snax_KUL_cluster_xdma/xdmaCtrl/io_remoteXDMACfg_toRemote_bits
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/i_snax_KUL_cluster_xdma/xdmaCtrl/io_remoteXDMACfg_toRemote_ready
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/i_snax_KUL_cluster_xdma/xdmaCtrl/io_remoteXDMACfg_toRemote_valid
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/i_snax_KUL_cluster_xdma/xdmaCtrl/_cfgToRemoteMux_io_out_bits_readerPtr
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/dma_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/dma_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/w_finish
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/w_ready
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/burst_d
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/burst_q
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/write_req
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/current_aw_req
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/current_w_req
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/slv_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_master/slv_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/mst_ports_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/mst_ports_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_resp_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_in_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_in_resp_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_out_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_out_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/dma_xbar_rule
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_wide_xbar_quadrant_s1/addr_map_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/wide_in_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/wide_in_resp_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/wide_out_req_o
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/wide_out_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/wide_in_resp_o
add wave -noupdate -itemcolor Salmon -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3]} {-height 23 -itemcolor Salmon -expand} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].aw_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].ar_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].w_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].b_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].b} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].b.id} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].b.resp} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].b.user} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].r_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].r} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].r.id} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].r.data} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].r.resp} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].r.last} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[3].r.user} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2]} {-height 23 -itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].aw_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].ar_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].w_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].b_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].b} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].b.id} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].b.resp} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].b.resp[1]} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].b.resp[0]} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].b.user} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].r_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[2].r} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1]} {-height 23 -itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].aw_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].ar_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].w_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b.id} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b.id[2]} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b.id[1]} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b.id[0]} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b.resp} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].b.user} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].r_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[1].r} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0]} {-height 23 -itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0].aw_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0].ar_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0].w_ready} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0].b_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0].b} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0].r_valid} {-itemcolor Salmon} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp[0].r} {-itemcolor Salmon}} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_slv_rsp
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_mst_rsp[1]} -expand {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_mst_rsp[1].w_ready} {-color Salmon}} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/wide_axi_mst_rsp
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/wide_xbar_quadrant_s1_out_rsp[1]} -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/wide_xbar_quadrant_s1_out_rsp
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/wide_xbar_quadrant_s1_in_rsp[2]} -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/wide_xbar_quadrant_s1_in_rsp
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/wide_out_1_rsp
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/slv_ports_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/slv_ports_resp_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_slave/dma_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_slave/dma_ready_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_slave/dma_valid_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_slave/slv_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_slave/slv_resp_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_req2xdma_0/cfg_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_req2xdma_0/cfg_ready_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_req2xdma_0/cfg_valid_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/fromRemote_cfg_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/fromRemote_cfg_ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/fromRemote_cfg_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/toRemote_cfg_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/toRemote_cfg_ready_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/toRemote_cfg_valid_o
add wave -noupdate -radix hexadecimal /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/toRemote_data_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/toRemote_data_ready_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_snax_core_1_xdma/toRemote_data_valid_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/cfg
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/cfg_ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/cfg_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/data
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/data_ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/data_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/req_ready_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/state
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/dma_ready_o
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_resp_i
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/dma_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/req_valid_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/sel
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/base_addr
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/bound_product
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/burst_len_data
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/u_xdma2req_0/cfg_reg
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/fromRemote_data_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/fromRemote_data_ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_snax_core_1_xdma/fromRemote_data_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/dma_ready_i
add wave -noupdate -expand -subitemconfig {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_resp_i.w_ready {-color Salmon}} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_resp_i
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/dma_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/dma_valid_o
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/slv_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/slv_resp_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/dma_ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/dma_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/dma_valid_i
add wave -noupdate -expand -subitemconfig {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_req_o.w -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_resp_i
add wave -noupdate -childformat {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/burst_d.len -radix decimal}} -expand -subitemconfig {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/burst_d.len {-height 23 -radix decimal}} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/burst_d
add wave -noupdate -childformat {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/burst_q.len -radix decimal}} -expand -subitemconfig {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/burst_q.len {-height 23 -radix decimal}} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/burst_q
add wave -noupdate -expand -subitemconfig {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/write_req.aw -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/write_req
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/maxNumBeats
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/w_finish
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/slv_resp_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {243019000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 316
configure wave -valuecolwidth 215
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {242987249 ps} {243041931 ps}
bookmark add wave bookmark0 {{195482035 ps} {195495994 ps}} 23
