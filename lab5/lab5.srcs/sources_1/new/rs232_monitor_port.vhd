library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rs232_port_input is
    Generic (   
                clk_freq : INTEGER := 100000000;    -- clock frequency in Hz (default: 100 MHz)
                trans_speed : INTEGER := 9600       -- transmission speed in bps in RXD_i (default: 9600 bps)
            );
                    
    Port (
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            RXD_i : in STD_LOGIC;
            recv_ASCII_o : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
            recv_ASCII_enable_o : out STD_LOGIC := '0'
         );
       
end rs232_port_input;

architecture Behavioral of rs232_port_input is
    
    --czas przesy?ania jednogo bita (cykle procka na przeslanie jednego bita)
    constant bit_duration : integer := clk_freq / trans_speed;
    
--Bity danych wraz z
--bitem kontrolnym i bitami synchronizacji (start, stop) tworz? tzw. jednostk? informacyjn? SDU
--(Serial Data Unit).
    constant SDU_length   : integer := 10;
    
    type RECV_STATE is (NO_DATA, START, DATA, STOP); --stany odbierania
    
    --zamiana 4bitow na wlaczone segmenty wyswietlacza
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
    
    signal RXD_sync : STD_LOGIC := '1'; --zsynchronizowane rxd
    signal state        : RECV_STATE := NO_DATA; --stan przesy?ania
    signal bit_time_cnt : integer range 1 to bit_duration := 1;  --licznik przesy?ania bita (licznik zwiekszac o 1 co cykl zegara)
    signal bit_cnt      : integer range 0 to SDU_length-1 := 0; --aktualna odbierny bit (0-7)
    signal SDU_reg      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); --rejestr na odebrane bity (bajt danych)
    -- rejestr na odczytane znaki ascii (2 znaki)
    -- 8 bitów odczytanych -> 2 znaki hex do wyswietlenia
    signal digit_reg    : STD_LOGIC_VECTOR (31 downto 0) := (others => '1');
    signal testinput : CHARACTER;
    
begin

    --synchronizacja rxd_i z zegarem
    RXD_synchronized:
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            RXD_sync <= RXD_i;
        end if;
    end process;

    process(clk_i)
    begin
        if rising_edge(clk_i) then
            recv_ASCII_enable_o <= '0';
            if rst_i = '1' then --reset
                state <= NO_DATA;
                bit_time_cnt <= 1;
                bit_cnt <= 0;
                SDU_reg <= (others => '0');
                digit_reg <= (others => '1');
                recv_ASCII_o <= (others => '0');
                recv_ASCII_enable_o <= '0';
            else
                case state is
                    when NO_DATA =>
                        if RXD_sync = '0' then --rozpoczecie transmisji (bit startu = 0)
                            state <= START;
                            bit_time_cnt <= 1;
                            bit_cnt <= 0;
                        end if;
                    
                    when START =>
                        if bit_time_cnt = bit_duration then --kiedy skonczono przesylac bit startu
                            state <= DATA; --przejdz do stanu odbierania danych
                            bit_time_cnt <= 1;
                            bit_cnt <= 0;
                        else
                            bit_time_cnt <= bit_time_cnt + 1;
                        end if;
                    
                    when DATA =>
                        if (bit_time_cnt = bit_duration/2) then --odbierz i zapisz bit w po?owie przesy?ania
                           SDU_reg(bit_cnt) <= RXD_sync; 
                        end if;           
                    
                        if bit_time_cnt = bit_duration then --przejdz do odbierania kolejnego bitu
                            bit_time_cnt <= 1;
                            if bit_cnt = 7 then --odebrano 8bitow (przestan odbierac)
                                state <= STOP;
                            else
                                bit_cnt <= bit_cnt + 1; 
                            end if;
                        else
                            bit_time_cnt <= bit_time_cnt + 1;
                        end if;
                    
                    when STOP =>
                        if (bit_time_cnt = bit_duration/2) then
                            recv_ASCII_enable_o <= '1';
                            recv_ASCII_o <= SDU_reg(7 downto 0);
                
                            testinput <= CHARACTER'VAL(TO_INTEGER(UNSIGNED(SDU_reg(7 downto 0))));
                        end if;
                    
                        if bit_time_cnt = bit_duration then
                            state <= NO_DATA;                   
                        else
                            bit_time_cnt <= bit_time_cnt + 1;
                        end if;
                end case;
            end if;
        end if;
    end process;
end Behavioral;