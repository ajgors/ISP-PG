library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Modul generuje wspólrzedne x_val i y_val na podstawie ustawien czestotliwosci (x_freq, y_freq) i przesuniecia fazy
-- (y_offset). Wykorzystuje do tego podmodul DDS (singen), który generuje sygnal sinusoidalny na podstawie ustawionej
-- czestotliwosci i przesuniecia fazy
entity generator is
    Port ( 
    		clk : in STD_LOGIC;
    		value : in STD_LOGIC_VECTOR (7 downto 0); -- przelaczniki
           	x_freq_set : in STD_LOGIC; --sygnal ustaw freq x (x_freq_set => btn_i(3))
           	y_freq_set : in STD_LOGIC; -- sygnal ustaw freq y (y_freq_set => btn_i(2))
           	y_offset_set : in STD_LOGIC; --syganl ustaw offset y (y_offset_set => btn_i(1))
           	areset : in STD_LOGIC;
           	x_val : out STD_LOGIC_VECTOR (10 downto 0); --wyjscie wspolrzednej X
           	y_val : out STD_LOGIC_VECTOR (10 downto 0); --wyjscie wspolrzednej Y
           	ready: out STD_LOGIC --sygnal informujacy, ze wygenerowano nowa pare wspolrzednych.
           );
end generator;

architecture Behavioral of generator is
    
    --singen
	COMPONENT singen
	  PORT (
		aclk : IN STD_LOGIC;
		aclken : IN STD_LOGIC;
		aresetn : IN STD_LOGIC;
		s_axis_config_tvalid : IN STD_LOGIC;
		s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- 32-bitowa konfiguracja (czestotliwosc i przesuniecie fazy)
		s_axis_config_tlast : IN STD_LOGIC;
		m_axis_data_tvalid : OUT STD_LOGIC;
		m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); -- 16-bitowy wynik (tu uzywamy 11 bitow z konca jako sygnal)
		event_s_config_tlast_missing : OUT STD_LOGIC;
		event_s_config_tlast_unexpected : OUT STD_LOGIC
	  );
	END COMPONENT;


    
    -- reset - reset DDS
    -- speeding - oczekiwanie na pierwszy wygenerowany probek (dla X)
    -- ready_x - gotowy odczyt wspolrzednej X
    -- ready_y - gotowy odczyt wspolrzednejj Y
    -- config1 - wysylanie konfiguracji dla osi X do DDS
    -- config2 - wysylanie konfiguracji dla osi Y do DDS
	type GeneratorState is (reset, speeding, ready_x, ready_y, config1, config2);
	
	-- ** SYGNALY ** --
	signal state : GeneratorState := speeding;
	signal raw_data : STD_LOGIC_VECTOR(10 downto 0); -- 11-bitowy wynik (z 16-bitów m_axis_data_tdata DDS) reprezentujacy wartosc sinusoidy.
	signal unused : STD_LOGIC_VECTOR(15 downto 11);
	
	--	32-bitowa konfiguracja DDS. Zawiera ustawienia czestotliwosci i przesuniecia fazy (offsetu).
	-- bits[31:24] Phase offset (y_offset / x_offset)
    -- bits[23:8] Nieuzywane (zerowane)
    -- bits[7:0] Frequency tuning word (y_freq / x_freq)
	signal settings : STD_LOGIC_VECTOR(31 downto 0); -- faza jest (31 downto 16), czestatliwosc is (15 downto 0)
	
	--ustawienia X
	signal x_freq : STD_LOGIC_VECTOR(7 downto 0) := "11110000";
	signal x_offset : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); --przesuniecie fazy stale na 0

    --ustawienia Y
	signal y_freq : STD_LOGIC_VECTOR(7 downto 0) := "11110000";
	signal y_offset: STD_LOGIC_VECTOR(7 downto 0) := "11110000"; -- przesuniecie fazy
	
	signal raw_data_valid : STD_LOGIC; -- raw_data_valid sygnalizuje gotowosc nowej próbki.
	signal config_valid : STD_LOGIC := '0';
	signal config_last : STD_LOGIC := '0';
	signal rst : STD_LOGIC := '1';
begin

    dds_gen: singen
      PORT MAP (
        aclk => clk,
        aclken => '1',
        aresetn => rst,
        s_axis_config_tvalid => config_valid,   -- enable config + enable config for 1st (Kanal X to Channel 1) channel --Zgloszenie nowej konfiguracji. Gdy '1', sygnalizujemy, ze s_axis_config_tdata zawiera nowe dane konfiguracyjne.
        s_axis_config_tdata => settings,        -- konfiguracja wysylana sygnalem settings 
        s_axis_config_tlast => config_last,     -- enable config for 2nd channel (Kanal Y to Channel 2)
        
        m_axis_data_tvalid => raw_data_valid,   -- Dane wyjsciowe sa gotowe. Gdy '1', m_axis_data_tdata zawiera nowe próbke sygnalu.
        m_axis_data_tdata(15 downto 11) => unused, 
        m_axis_data_tdata(10 downto 0) => raw_data, -- próbka sygnalu sinusoidalnego. Zakres zalezy od konfiguracji DDS (zwykle liczba ze znakiem lub bez).
        event_s_config_tlast_missing => open,
        event_s_config_tlast_unexpected => open
      );
  
  process begin
  	wait until rising_edge(clk);
  	case state is
  	
  	    --gdy reset
  		when reset =>
  			rst <= '0';
			config_valid <= '0'; -- wylacz konfiguracjowanie
  			config_last <= '0';
  			state <= speeding;
  		
  		-- czekamy az DDS wygeneruje pierwsza wartosc (raw_data_valid='1'). Odczytujemy X i przechodzimy do ready_y
  		when speeding =>
  			rst <= '1';
  			if(raw_data_valid = '1') then
				x_val <= raw_data;
  				state <= ready_y;
  			end if;
  			
  		when ready_x =>
  			if(raw_data_valid = '1') then
				x_val <= raw_data;
  				state <= ready_y;
  				ready <= '0';
  			end if;
  		when ready_y =>
  			if(raw_data_valid = '1') then
				y_val <= raw_data;
	  			state <= ready_x;
	  			ready <= '1';
	  		end if;
	  		
	  	-- konfiguracja	
  		when config1 =>
  			state <= config2;
  			config_valid <= '1'; -- wlacz konfiguracje + wlacz konfigracje dla kanalu 1 (Kanal X to Channel 1)
  			settings(31 downto 24) <= x_offset; --dane na offset
			settings(23 downto 8) <= (others => '0');
  			settings(7 downto 0) <= x_freq; -- dane naczestatliwosc
  		when config2 =>
  			state <= reset;
  			config_last <= '1'; -- wlacz konfiguracje dla kanalu 2
			settings(31 downto 24) <= y_offset;
			settings(23 downto 8) <= (others => '0');
  			settings(7 downto 0) <= y_freq;
  	end case;
  	
  	
  	--ustawianie odpowiednich wartosci na przycisk
	if (x_freq_set = '1') then
  		x_freq <= value;
  	end if;
  	if (y_freq_set = '1') then
  		y_freq <= value;
  	end if;
  	if (y_offset_set = '1') then
  		y_offset <= value;
  	end if;
  	
  	-- przejdz do stanu configuracji na reset
	if(areset = '1' and state /= config1 and state /= config2 and state /= reset) then
  		state <= config1;
  		ready <= '0';
  	end if;
  end process;

end Behavioral;
