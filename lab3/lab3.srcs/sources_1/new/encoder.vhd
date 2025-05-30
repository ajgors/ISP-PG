library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder is
Port ( clk_i   : in STD_LOGIC;
           btn_i   : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i    : in STD_LOGIC_VECTOR (7 downto 0);
           digit_o : out STD_LOGIC_VECTOR (31 downto 0));
end encoder;

--W sygnale led7_seg_o segment A jest pod??czony do bitu 7, segment B do bitu 6, itd.
--segmenty A B C D E F G i DP(kropka)
architecture Behavioral of encoder is
--number -> segmenty wyswietlacza
    signal number: std_logic_vector(6 downto 0) := (others => '1');
begin
--odpowienie ustawianie numbers na podstawie sw_i (z liczby na w??czone segmenty)
    with sw_i(3 downto 0) select
	number(6 downto 0) <= "0000001" when "0000", -- 0
					  "1001111" when "0001", -- 1
					  "0010010" when "0010", -- 2
					  "0000110" when "0011", -- 3
					  "1001100" when "0100", -- 4
					  "0100100" when "0101", -- 5
					  "0100000" when "0110", -- 6
					  "0001111" when "0111", -- 7
					  "0000000" when "1000", -- 8
					  "0000100" when "1001", -- 9
					  "0001000" when "1010", -- A
					  "1100000" when "1011", -- B
					  "0110001" when "1100", -- C
					  "1000010" when "1101", -- D
					  "0110000" when "1110", -- E
					  "0111000" when "1111", -- F
					  "1111111" when others; --zgaszone
					  
	set: process( clk_i, btn_i(3 downto 0), sw_i (7 downto 4))
	begin
	--ustawianie kropek
		digit_o(0) <= not sw_i(4); 
		digit_o(8) <= not sw_i(5);
		digit_o(16) <= not sw_i(6);
		digit_o(24) <= not sw_i(7);
	--ustawianie digit_o 
		if rising_edge(clk_i) then
		  if btn_i(0) = '1'  then
			digit_o(7 downto 1) <= number;
		  elsif btn_i(1) = '1'  then
			digit_o(15 downto 9) <= number;
		  elsif btn_i(2) = '1'  then
			digit_o(23 downto 17) <= number;
		  elsif btn_i(3) = '1'  then
			digit_o(31 downto 25) <= number;
		  end if;
		end if;
	end process set;
end Behavioral;
