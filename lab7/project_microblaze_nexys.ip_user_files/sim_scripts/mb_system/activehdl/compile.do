vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/microblaze_v11_0_1
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_gpio_v2_0_21
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_uartlite_v2_0_23
vlib activehdl/lmb_v10_v3_0_9
vlib activehdl/lmb_bram_if_cntlr_v4_0_16
vlib activehdl/blk_mem_gen_v8_4_3
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_19
vlib activehdl/fifo_generator_v13_2_4
vlib activehdl/axi_data_fifo_v2_1_18
vlib activehdl/axi_crossbar_v2_1_20
vlib activehdl/axi_intc_v4_1_13
vlib activehdl/mdm_v3_2_16
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/axi_timer_v2_0_21
vlib activehdl/axi_protocol_converter_v2_1_19

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap microblaze_v11_0_1 activehdl/microblaze_v11_0_1
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_21 activehdl/axi_gpio_v2_0_21
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_23 activehdl/axi_uartlite_v2_0_23
vmap lmb_v10_v3_0_9 activehdl/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 activehdl/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 activehdl/blk_mem_gen_v8_4_3
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_19 activehdl/axi_register_slice_v2_1_19
vmap fifo_generator_v13_2_4 activehdl/fifo_generator_v13_2_4
vmap axi_data_fifo_v2_1_18 activehdl/axi_data_fifo_v2_1_18
vmap axi_crossbar_v2_1_20 activehdl/axi_crossbar_v2_1_20
vmap axi_intc_v4_1_13 activehdl/axi_intc_v4_1_13
vmap mdm_v3_2_16 activehdl/mdm_v3_2_16
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap axi_timer_v2_0_21 activehdl/axi_timer_v2_0_21
vmap axi_protocol_converter_v2_1_19 activehdl/axi_protocol_converter_v2_1_19

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_1 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_microblaze_0_1/sim/mb_system_microblaze_0_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_clk_wiz_0_3/mb_system_clk_wiz_0_3_clk_wiz.v" \
"../../../bd/mb_system/ip/mb_system_clk_wiz_0_3/mb_system_clk_wiz_0_3.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_21 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/9c6e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_axi_gpio_0_3/sim/mb_system_axi_gpio_0_3.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_23 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/0315/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_axi_uartlite_0_3/sim/mb_system_axi_uartlite_0_3.vhd" \
"../../../bd/mb_system/ip/mb_system_axi_gpio_1_3/sim/mb_system_axi_gpio_1_3.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_dlmb_v10_3/sim/mb_system_dlmb_v10_3.vhd" \
"../../../bd/mb_system/ip/mb_system_ilmb_v10_3/sim/mb_system_ilmb_v10_3.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_dlmb_bram_if_cntlr_3/sim/mb_system_dlmb_bram_if_cntlr_3.vhd" \
"../../../bd/mb_system/ip/mb_system_ilmb_bram_if_cntlr_3/sim/mb_system_ilmb_bram_if_cntlr_3.vhd" \

vlog -work blk_mem_gen_v8_4_3  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_lmb_bram_3/sim/mb_system_lmb_bram_3.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_lmb_v10_3/sim/mb_system_lmb_v10_3.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_18  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_20  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_xbar_1/sim/mb_system_xbar_1.v" \

vcom -work axi_intc_v4_1_13 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c0fe/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_microblaze_0_axi_intc_0/sim/mb_system_microblaze_0_axi_intc_0.vhd" \

vcom -work mdm_v3_2_16 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/550e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_mdm_1_3/sim/mb_system_mdm_1_3.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_rst_clk_wiz_0_100M_3/sim/mb_system_rst_clk_wiz_0_100M_3.vhd" \

vcom -work axi_timer_v2_0_21 -93 \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/a788/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mb_system/ip/mb_system_axi_timer_0_0/sim/mb_system_axi_timer_0_0.vhd" \
"../../../bd/mb_system/sim/mb_system.vhd" \

vlog -work axi_protocol_converter_v2_1_19  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/c923" "+incdir+../../../../project_microblaze_nexys.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_auto_pc_0/sim/mb_system_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

