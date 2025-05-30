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
    Port ( sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is


signal par : STD_LOGIC;

begin
par <= sw_i(0) xor sw_i(1) xor sw_i(2) xor sw_i(3) xor sw_i(4) xor sw_i(5) xor sw_i(6) xor sw_i(7);

process(par)
begin
if (par = '0') then
led7_seg_o <= "01100001";

elsif (par = '1') then
led7_seg_o <= "00000011";

else
led7_seg_o <= "11111111";

end if;
end process;

led7_an_o <= "1110";

end Behavioral;
