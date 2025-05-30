library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity bounce_testbench is
--  Port ( );
end bounce_testbench;

architecture Behavioral of bounce_testbench is

	component top is
		Port ( clk_i : in STD_LOGIC;
			   rst_i : in STD_LOGIC;
			   led_o : out STD_LOGIC_VECTOR (2 downto 0));
	end component top;
	
	component bounce is
	    Port ( in_i : in STD_LOGIC;
	           out_o : out STD_LOGIC);
	end component bounce;
	
	signal clk_i : STD_LOGIC := '0';
	signal rst_i : STD_LOGIC := '0';
	signal led_o : STD_LOGIC_VECTOR (2 downto 0);
	
	signal clk_dirty : STD_LOGIC := '0';

begin

	comp: top port map (
		clk_i => clk_i,
		rst_i => rst_i,
		led_o => led_o);
	
	clk_i <= not clk_i after 50 ms;
	
	stin: process
	begin
		wait for 100 ms;
		rst_i <= '1';
		wait for 100 ms;
		rst_i <= '0';
		wait for 270 ms;
		rst_i <= '1';
		wait for 50 ms;
		rst_i <= '0';
		wait;
	end process;


end Behavioral;