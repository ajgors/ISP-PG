--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Mon Jun  2 03:55:42 2025
--Host        : fpgalab214 running 64-bit major release  (build 9200)
--Command     : generate_target mb_system_wrapper.bd
--Design      : mb_system_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mb_system_wrapper is
  port (
    dual_seven_seg_led_disp_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    seven_seg_led_an_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
end mb_system_wrapper;

architecture STRUCTURE of mb_system_wrapper is
  component mb_system is
  port (
    sys_clock : in STD_LOGIC;
    seven_seg_led_an_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dual_seven_seg_led_disp_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reset : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC;
    led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component mb_system;
begin
mb_system_i: component mb_system
     port map (
      dual_seven_seg_led_disp_tri_o(7 downto 0) => dual_seven_seg_led_disp_tri_o(7 downto 0),
      led_16bits_tri_o(15 downto 0) => led_16bits_tri_o(15 downto 0),
      reset => reset,
      seven_seg_led_an_tri_o(7 downto 0) => seven_seg_led_an_tri_o(7 downto 0),
      sys_clock => sys_clock,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
end STRUCTURE;
