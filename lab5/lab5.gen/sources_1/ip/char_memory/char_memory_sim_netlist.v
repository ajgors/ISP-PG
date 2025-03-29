// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Mar 29 13:44:14 2025
// Host        : DESKTOP-1GOTFFO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/igors/Desktop/studia/SEM6/isp/lab5/lab5.gen/sources_1/ip/char_memory/char_memory_sim_netlist.v
// Design      : char_memory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "char_memory,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module char_memory
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
  char_memory_blk_mem_gen_v8_4_9 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25504)
`pragma protect data_block
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
fJlVmIKX9yeFDjxYZCsXD7x0il8uoX1Pgg==
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
