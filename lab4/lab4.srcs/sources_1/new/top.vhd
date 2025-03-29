----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 04:34:38 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;



architecture Behavioral of top is
    signal digit_i : STD_LOGIC_VECTOR (31 downto 0);
    
    component rs232_monitor_port is
         Port ( clk_i : in STD_LOGIC;
               rst_i : in STD_LOGIC;
               RXD_i : in STD_LOGIC;
               digit_o : out STD_LOGIC_VECTOR (31 downto 0)
           );
    end component rs232_monitor_port;
           
     component display is
        Port ( clk_i : in STD_LOGIC;
               rst_i : in STD_LOGIC;
               digit_i : in STD_LOGIC_VECTOR (31 downto 0);
               led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
               led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
           );
    end component display;
    
begin

   comp_display: display port map(
        clk_i => clk_i,
        rst_i => rst_i,
        digit_i => digit_i,
        led7_an_o => led7_an_o,
        led7_seg_o => led7_seg_o
    );
    
    comp_rs232_port_monitor: rs232_monitor_port port map(
        clk_i => clk_i,
        rst_i => rst_i,
        RXD_i => RXD_i,
        digit_o => digit_i
    );
    
end Behavioral;