library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

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
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is

signal d, q : STD_LOGIC_VECTOR (2 downto 0);

begin
    counter: process(clk_i, rst_i) is
        begin
            if rst_i = '1' then
                q <= "000";
            elsif rising_edge(clk_i) then
                q <= d;
            end if;
        end process counter;
    
    d <= q + 1;

--  gray = liczba ^ (liczba >> 1)
-- 000, 001, 011, 010, 110, 111, 101, 100
    gray_encoder: led_o <= q xor STD_LOGIC_VECTOR(shift_right(UNSIGNED(q), 1));

end Behavioral;