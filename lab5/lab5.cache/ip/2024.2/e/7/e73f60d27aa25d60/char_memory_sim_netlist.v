// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Mar 29 13:44:13 2025
// Host        : DESKTOP-1GOTFFO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ char_memory_sim_netlist.v
// Design      : char_memory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "char_memory,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [11:0]addra;
  wire clka;
  wire [7:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.326399 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "char_memory.mem" *) 
  (* C_INIT_FILE_NAME = "char_memory.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25552)
`pragma protect data_block
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
KyBSosmDuoRKK5L4tEbFNw==
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
