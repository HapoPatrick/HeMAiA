onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/addr_map_i[0]} -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/addr_map_i
add wave -noupdate -subitemconfig {{/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_req_i[1]} -expand {/tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_req_i[1].aw} -expand} /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_req_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/mst_ports_req_o
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/mst_ports_resp_i
add wave -noupdate /tb_bin/i_dut/i_occamy/i_occamy_soc/i_occamy_quadrant_s1_0/i_occamy_cluster_0/i_cluster/i_axi_dma_xbar/slv_ports_resp_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {242954619 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 227
configure wave -valuecolwidth 189
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
WaveRestoreZoom {242939692 ps} {242970259 ps}
