// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Mar 29 13:55:05 2025
// Host        : DESKTOP-1GOTFFO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_mem_sim_netlist.v
// Design      : fifo_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_mem,fifo_generator_v13_2_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_11,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_mode = "slave core_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [5:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [5:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [5:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "6" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "62" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "61" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "6" *) 
  (* C_RD_DEPTH = "64" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "6" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "6" *) 
  (* C_WR_DEPTH = "64" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "6" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_11 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[5:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[5:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[5:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 76624)
`pragma protect data_block
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
NCr7arW4hUJ6Fj7nVHj6ew==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
