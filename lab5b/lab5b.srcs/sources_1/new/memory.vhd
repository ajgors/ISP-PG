library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Ten modu? VHDL implementuje pamiec wideo z mozliwoscia czyszczenia. Mozna do niej zapisywac pojedyncze bity
-- odczytywac i czyscic calosc, ustawiajac wszystkie bity na '0'.
    -- Umozliwia zapis i odczyt do/z pamieci RAM (reprezentowanej przez komponent video_mem)
    -- Umozliwia czyszczenie pami?ci poprzez zapis '0' do ka?dego adresu
    -- Posiada sygnal busy, który wskazuje, czy trwa proces czyszczenia
    
-- ma rozmiar 384x384 adresacja od 0

entity memory is
	Generic(
		x_size : integer := 384;
		y_size : integer := 384
	);
    Port ( clk_i : in STD_LOGIC;
           w_en : in STD_LOGIC;                         -- Enable zapisu (aktywny wysoki)
           w_addr : in STD_LOGIC_VECTOR(17 DOWNTO 0);   -- Adres do zapisu
           w_data : in STD_LOGIC;                       -- Dana do zapisu (bit 0 lub 1)
           
           r_addr : in STD_LOGIC_VECTOR(17 DOWNTO 0);   -- Adres do odczytu
           r_data : out STD_LOGIC;                      -- Wynik odczytu (bit)
           clear : in STD_LOGIC;                        -- Gdy '1', rozpoczyna czyszczenie calej pamieci (clear => btn_i(0), --reset pamieci)
           busy : out STD_LOGIC);                       -- Sygnalizuje, ?e trwa czyszczenie (nie mozna zapisywac)
end memory;

architecture Behavioral of memory is
	
	COMPONENT video_mem
	  PORT (
		clka : IN STD_LOGIC;
		wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);        -- 1 - zapis, 0 - brak zapisu
		addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);     -- Adres zapisu
		dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);       -- Dane do zapisu (1 bit w std_logic_vector(0 downto 0))
		clkb : IN STD_LOGIC;                          -- Zegar odczytu
		addrb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);     -- Adres odczytu
		doutb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)      -- Dane wyj?ciowe odczytu
	  );
	END COMPONENT;
	
	-- working - Odczyt i zapis dzia?aj? normalnie
	-- clearing - czyszczenie pami?ci
	type MemoryState is (working, clearing);
	
	signal state : MemoryState := clearing;
	
	signal clr_pos : integer := 0; --pozycja czyszczenia w ramie
	
	signal int_write_data : STD_LOGIC := '0';
	signal int_write_addr : STD_LOGIC_VECTOR(17 DOWNTO 0);
	signal int_write_enable : STD_LOGIC := '0';
	
begin

	process begin
		wait until rising_edge(clk_i);
		case state is
		
			when working =>
				if(clear = '1') then
					busy <= '1';
					state <= clearing; -- przechodzimy do stanu czyszczenias
				end if;
				
			when clearing => -- clearing - czyszczenie pamieci
			
			    --czyscimy ram od 0-384x384
				if(clr_pos + 1 >= x_size * y_size) then
					clr_pos <= 0;
                    state <= working; --przechodzimy spowrotem do stanu working
                    busy <= '0';
				else
					clr_pos <= clr_pos + 1;
				end if;
		
		end case;
	end process;
	
	video_memc : video_mem
	  PORT MAP (
	    clka => clk_i,
	    wea(0) => int_write_enable,    -- wlaczenie zapisywanie 
	    addra => int_write_addr,       -- adres do zapisania
	    dina(0) => int_write_data,     -- dane do zapisanie
	    clkb => clk_i,
	    addrb => r_addr,
	    doutb(0) => r_data
	  );
	  
	  int_write_data <= '0' when state = clearing else '1';    -- dane do zapisanie (0 - gdy jest czyszenie)
	  int_write_enable <= '1' when state = clearing else w_en; -- wlaczenie zapisywanie
	  int_write_addr <= std_logic_vector(to_unsigned(clr_pos, 18)) when state = clearing else w_addr; 
	  
	
end Behavioral;
