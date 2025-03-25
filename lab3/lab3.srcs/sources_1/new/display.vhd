----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 12:45:52 PM
-- Design Name: 
-- Module Name: display - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Generic (   clk_freq : integer := 100000000; -- clock frequency in Hz (default: 100 MHz)
                work_freq : integer := 1000 ); -- working frequency in Hz of the display component (default: 1 kHz)
Port ( clk_i     : in STD_LOGIC;
        rst_i : in std_logic := '0';
           digit_i   : in STD_LOGIC_VECTOR (31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o: out STD_LOGIC_VECTOR (7 downto 0));
end display;

architecture Behavioral of display is
   signal active_digit : std_logic_vector(2 downto 0) := "100";
    -- 000 -pierwszy wyswietlacz
    -- 001 -drugi wyswietlacz
    -- 010 -trzeci wyswietlacz
    -- 011 -czwarty wyswietlacz
    -- pozostałe -> zgaś wyświetlacze
    
    signal clk_freq_div_cnt : integer := 0; --liczbik multipeksacji
    signal work_freq_clk_enable : STD_LOGIC := '0'; --flaga zmiany wyswietalcza

begin
--ustawienie led7_seg_o (segmenty) wyświetlacza na podstawie sygnału active_digit i digit_i
with active_digit select
	led7_seg_o <=  digit_i(31 downto 24) when "000",
						digit_i(23 downto 16) when "001",
						digit_i(15 downto 8) when "010",
						digit_i(7 downto 0) when "011",
						"11111111" when others;
-- ustawienie led7_an_o (anoda) na podstawie active_digit
with active_digit select
	led7_an_o <=   "0111" when "000",  
						"1011" when "001",
						"1101" when "010",
						"1110" when "011",
						"1111" when others; 
					
 --multipleksacja 1khz = 1ms (zamiana aktywnego wyświetlacza na kolejny)
 --100mhz, czyli 100000000 operacji w 1s
 --czyli aby zmieniać wyświetlacz co 1ms musimy zmienic jak sie wykona 100000000/1000 operacji (clk_freq/work_freq)
    clk_freq_divider: process (clk_i, rst_i, active_digit) is
    begin
        if rst_i = '1' then
            clk_freq_div_cnt <= 0;
            active_digit <= "100";
        elsif rising_edge(clk_i) then
            if (clk_freq_div_cnt = clk_freq/work_freq) then --jak licznik jest równy
                clk_freq_div_cnt <= 0; --zerowanie licznika
                --nastepny wyswietlacz
				if( active_digit = "100" or active_digit = "011" ) then
				    active_digit <= "000";
			     else
				    active_digit <= active_digit + 1;
			     end if;
            else
                clk_freq_div_cnt <= clk_freq_div_cnt + 1; -- zwiekszamy  licznik
            end if;
        end if;
    end process clk_freq_divider;
end Behavioral;
