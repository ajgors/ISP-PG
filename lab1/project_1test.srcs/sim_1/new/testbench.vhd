----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025 03:02:04 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
component top is
    Port ( sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal sw : STD_LOGIC_VECTOR(7 downto 0);
signal led7_s : STD_LOGIC_VECTOR(7 downto 0);
signal led7_a : STD_LOGIC_VECTOR(3 downto 0);

begin

uut: top PORT MAP(
sw_i => sw,
led7_seg_o => led7_s,
led7_an_o => led7_a
);

tb : PROCESS
begin
wait for 100 ms;
sw(0) <= '1';
wait for 100 ms;
sw(1) <= '1';
wait for 100 ms;
sw(2) <= '1';
wait for 100 ms;
sw(3) <= '1';
wait for 100 ms;
sw(4) <= '1';
wait for 100 ms;
sw(5) <= '1';
wait for 100 ms;
sw(6) <= '1';
wait for 100 ms;
sw(7) <= '1';
end process;

end Behavioral;
