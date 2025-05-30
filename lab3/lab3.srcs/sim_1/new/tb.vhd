----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 12:49:53 PM
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
component top is

Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end component top;
    
    signal clk_i   : STD_LOGIC := '0';
    signal btn_i   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal sw_i    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal led7_an_o : STD_LOGIC_VECTOR(3 downto 0);
    signal led7_seg_o : STD_LOGIC_VECTOR(7 downto 0);

    constant clk_period : time := 10 ns;

begin

    dut: top port map ( 
        clk_i => clk_i,
        btn_i => btn_i,
        sw_i => sw_i,
        led7_an_o => led7_an_o,
        led7_seg_o => led7_seg_o );

   
clk_i <= not clk_i after 5 ns; -- T = 10 ns | f = 100 MHz
   
 --0 3 6 9 na kolejno 4, 3, 2, 1 wy?wietlaczu  
   
sim_btns: process
    begin
        wait for 1 ms;
        
        btn_i(3) <= '1'; -- 1
        wait for 1 ms;
        btn_i(3) <= '0'; -- 2
        wait for 2 ms;
        
        btn_i(2) <= '1'; -- 4
        wait for 1 ms;
        btn_i(2) <= '0'; -- 5
        wait for 2 ms;
        
        btn_i(1) <= '1'; -- 7
        wait for 1 ms;
        btn_i(1) <= '0'; -- 8
        wait for 2 ms;
        
        btn_i(0) <= '1'; -- 10
        wait for 1 ms;
        btn_i(0) <= '0'; -- 11
        wait for 2 ms;
        
        btn_i(3) <= '1'; -- 13
        wait for 1 ms;
        btn_i(3) <= '0'; -- 14
        wait for 2 ms;
        
        btn_i(2) <= '1'; -- 16
        wait for 1 ms; 
        btn_i(2) <= '0'; -- 17
        
        wait;
    end process;
    
    sim_dots: process
    begin
        sw_i(7 downto 4) <= "1001"; -- 0
        wait for 6 ms;
       
        sw_i(7 downto 4) <= "0101"; -- 6
        wait for 6 ms;
        
        sw_i(7 downto 4) <= "1000"; -- 12

        wait;
    end process;
    
    sim_digits: process
    begin
        sw_i(3 downto 0) <= "0000"; -- 0
        wait for 3 ms;

        sw_i(3 downto 0) <= "0011"; -- 3
        wait for 3 ms;
        
        sw_i(3 downto 0) <= "0110"; -- 6
        wait for 3 ms;
        
        sw_i(3 downto 0) <= "1001"; -- 9
        wait for 3 ms;
        
        sw_i(3 downto 0) <= "1100"; -- 12 (C)
        wait for 3 ms;
        
        sw_i(3 downto 0) <= "1111"; -- 15 (F)
        
        wait;
    end process;
end Behavioral;
