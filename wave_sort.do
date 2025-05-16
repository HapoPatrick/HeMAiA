onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {cluster 0}
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/clk_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/rst_ni
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/test_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/addr_map_i
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_req_i
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_resp_o
add wave -noupdate -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/mst_ports_req_o[1]} -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/mst_ports_req_o
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/mst_ports_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/en_default_mst_port_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/default_mst_port_i
add wave -noupdate -divider {cluster 1}
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/clk_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/rst_ni
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/test_i
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/slv_ports_req_i
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/genblk1/w_open}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/genblk1/w_select}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/genblk1/w_select_valid}
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/slv_ports_resp_o[3]} -expand {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/slv_ports_resp_o[3].w_ready} {-color Salmon}} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/slv_ports_resp_o
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_req_o[1]} -expand {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_req_o[1].aw_valid} {-color Coral} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_req_o[1].w_valid} {-color Coral}} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_req_o
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_resp_i[1]} -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/addr_map_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/en_default_mst_port_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/default_mst_port_i
add wave -noupdate -divider {cluster 1 - master}
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/buffer_empty
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/buffer_full
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/buffer_in
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/buffer_out
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/buffer_pop
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/buffer_push
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/BufferDepth
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/cnt_valid_d
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/cnt_valid_q
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/data_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/data_path_idle_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/data_ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/data_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/is_last_w
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/num_beats_d
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/num_beats_q
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_data_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_data_type_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_dp_ready_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_dp_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_last_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_num_beats_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_ready_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/w_valid_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/i_axi_dma_datapath/write_happening
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/slv_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/burst_q
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/current_aw_req
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/current_w_req
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/dma_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/dma_valid_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/ready_o
add wave -noupdate -expand -subitemconfig {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/write_req.aw -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/u_axi_master/write_req
add wave -noupdate -divider {cluster 0 - slave}
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/aw_fifo_empty
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/aw_fifo_full
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/aw_fifo_pop
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/aw_fifo_push
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/aw_info_out
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/buffer_empty
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/buffer_full
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/buffer_in
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/buffer_last_full
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/buffer_out
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/buffer_pop
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/buffer_push
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/cnt_valid_d
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/cnt_valid_q
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/dma_ready_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/dma_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/dma_valid_o
add wave -noupdate -color Pink /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/is_last_w
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/is_last_w_q
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/last_w
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/last_w_flag
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/num_beats_d
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/num_beats_q
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/slv_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/slv_resp_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/write_happening
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/u_axi_slave/write_req
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {178363650 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
configure wave -valuecolwidth 99
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
WaveRestoreZoom {178355948 ps} {178369557 ps}
