library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div is
	Generic(divisior : integer);
    Port ( clk_i : in STD_LOGIC;
    		rst_i : in STD_LOGIC;
           clk_o : out STD_LOGIC := '0');
end clk_div;

architecture Behavioral of clk_div is

constant max_count: integer := divisior / 2;
signal counter: integer := -1;
begin

proc: process(clk_i) is
begin
if rising_edge(clk_i) then
		counter <= counter + 1;
		
		if(counter = 2*max_count-1) then
			counter <= 0;
			clk_o <= '0';
		end if;
		if(counter = max_count-1) then
			clk_o <= '1';
		end if;
	end if;
end process;

end Behavioral;
