onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/clk_i}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/rst_ni}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/test_i}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/slv_req_i}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/slv_aw_select_i}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/slv_ar_select_i}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/slv_resp_o}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/mst_reqs_o}
add wave -noupdate -expand /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/mst_ports_resp_i
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_mst_port_mux[1]/i_axi_mux/slv_resps_o}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_mst_port_mux[1]/i_axi_mux/mst_resp_i}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_mst_port_mux[1]/i_axi_mux/gen_mux/mst_w_ready}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_mst_port_mux[1]/i_axi_mux/gen_mux/w_fifo_data}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_mst_port_mux[1]/i_axi_mux/gen_mux/w_fifo_empty}
add wave -noupdate -expand {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_mst_port_mux[1]/i_axi_mux/gen_mux/slv_w_readies}
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/mst_resps_i[1]} -expand} {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/mst_resps_i}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/genblk1/w_open}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/genblk1/w_select}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[3]/i_axi_demux/i_demux_simple/genblk1/w_select_valid}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[1]/i_axi_demux/i_demux_simple/genblk1/w_open}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[1]/i_axi_demux/i_demux_simple/genblk1/w_select}
add wave -noupdate {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_1/i_cluster/i_axi_dma_xbar/gen_slv_port_demux[1]/i_axi_demux/i_demux_simple/genblk1/w_select_valid}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {178362636 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 218
configure wave -valuecolwidth 79
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
WaveRestoreZoom {178334774 ps} {178377925 ps}
