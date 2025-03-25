library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rs232_monitor_port is
    Generic (
        clk_freq    : integer := 100000000;
        trans_speed : integer := 9600
    );
    Port (
        clk_i   : in  STD_LOGIC;
        rst_i   : in  STD_LOGIC;
        RXD_i   : in  STD_LOGIC;
        digit_o : out STD_LOGIC_VECTOR (31 downto 0)
    );
end rs232_monitor_port;

architecture Behavioral of rs232_monitor_port is
   
    --czas przesyłania jednogo bita
    constant bit_duration : integer := clk_freq / trans_speed;

--Bity danych wraz z
--bitem kontrolnym i bitami synchronizacji (start, stop) tworzą tzw. jednostkę informacyjną SDU
--(Serial Data Unit).
    constant SDU_length   : integer := 10;
    
    type RECV_STATE is (NO_DATA, START, DATA, STOP);
    
    function seven_seg(data_in: std_logic_vector(3 downto 0)) return std_logic_vector is
    begin
        case data_in is 
            when "0000" => return "0000001"; -- 0
            when "0001" => return "1001111"; -- 1
            when "0010" => return "0010010"; -- 2
            when "0011" => return "0000110"; -- 3
            when "0100" => return "1001100"; -- 4
            when "0101" => return "0100100"; -- 5
            when "0110" => return "0100000"; -- 6
            when "0111" => return "0001111"; -- 7
            when "1000" => return "0000000"; -- 8
            when "1001" => return "0000100"; -- 9
            when "1010" => return "0001000"; -- A
            when "1011" => return "1100000"; -- b
            when "1100" => return "0110001"; -- C
            when "1101" => return "1000010"; -- d
            when "1110" => return "0110000"; -- E
            when "1111" => return "0111000"; -- F
            when others => return "1111110"; -- -
        end case;
    end function;
    
    --zsynchronizowane rxd
    signal RXD_sync     : STD_LOGIC := '0';
    
    --stan przesyłania
    signal state        : RECV_STATE := NO_DATA;
    
    --licznik przesyłania bita
    signal bit_time_cnt : integer range 1 to bit_duration := 1;
    
    --licznik przesłanych bitow (0 do 9)
    signal bit_cnt      : integer range 0 to SDU_length-1 := 0;
    
    --rejestr dop przechowywania odebranych bitów
    signal SDU_reg      : STD_LOGIC_VECTOR(SDU_length-1 downto 0) := (others => '0');
    
    -- rejestr na odczytane znaki ascii (2 znaki)
    -- 8 bitów odczytanych -> 2 znaki asci po 4 bit
    signal digit_reg    : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    
begin
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            RXD_sync <= RXD_i;
            
            if rst_i = '1' then
                state <= NO_DATA;
                bit_time_cnt <= 1;
                bit_cnt <= 0;
                SDU_reg <= (others => '0');
                digit_reg <= (others => '0');
            else
                if state = NO_DATA and RXD_sync = '0' then
                    state <= START;
                elsif state = START and bit_cnt = 0 then
                    state <= DATA;
                elsif state = DATA and bit_cnt = 8 then
                    state <= STOP;
                elsif state = STOP and bit_cnt = 9 then
                    state <= NO_DATA;
                end if;
                
                if bit_time_cnt = bit_duration then
                    bit_time_cnt <= 1;
                    if state /= STOP then bit_cnt <= bit_cnt + 1; end if;
                else
                    bit_time_cnt <= bit_time_cnt + 1;
                end if;
                
                if bit_time_cnt = bit_duration / 2 and state /= NO_DATA then
                    SDU_reg(bit_cnt) <= RXD_sync;
                end if;
                
                if state = STOP and bit_time_cnt = bit_duration / 2 then
                    digit_reg(15 downto 9) <= seven_seg(SDU_reg(8 downto 5)); --przeslanie na lewy wyswietlacz
                    digit_reg(7 downto 1)  <= seven_seg(SDU_reg(4 downto 1)); --na prawy
                end if;
            end if;
        end if;
    end process;
    
    digit_o <= digit_reg;
    
end Behavioral;
