// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Mar 29 13:55:06 2025
// Host        : DESKTOP-1GOTFFO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/igors/Desktop/studia/SEM6/isp/lab5/lab5.gen/sources_1/ip/fifo_mem/fifo_mem_sim_netlist.v
// Design      : fifo_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_mem,fifo_generator_v13_2_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_11,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module fifo_mem
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
  fifo_mem_fifo_generator_v13_2_11 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 76272)
`pragma protect data_block
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
FWFMi+Jb
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
