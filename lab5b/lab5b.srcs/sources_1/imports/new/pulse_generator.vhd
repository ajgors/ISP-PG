library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- generowane jest wyjscie 1 jak zmienil sie sygnal wejsiowy (1->0, 0->1)
-- wyjscie jest 0 jesli nie zmienili sie sygnal (0->0, 1->1)

entity pulse_generator is
    Port ( clk : in STD_LOGIC;
           signal_i : in STD_LOGIC;
           pulse_o : out STD_LOGIC);
end pulse_generator;

architecture Behavioral of pulse_generator is
signal prev_sig : STD_LOGIC := '0';

begin

prev_sig <= signal_i when rising_edge(clk);
pulse_o <= prev_sig xor signal_i;

end Behavioral;
