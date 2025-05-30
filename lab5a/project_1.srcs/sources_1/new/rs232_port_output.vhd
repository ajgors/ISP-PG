library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rs232_port_output is
    Generic (   
        clk_freq    : INTEGER := 100000000; -- czestotliwosc zegara (Hz)
        trans_speed : INTEGER := 9600       -- predkosc transmisji (bps)
    );
    Port ( 
        clk_i                : in STD_LOGIC;
        rst_i                : in STD_LOGIC;
        TXD_o                : out STD_LOGIC := '1'; --wyj?cie
        send_ASCII_i         : in STD_LOGIC_VECTOR (7 downto 0); -- input dane z asci_to_pseudo..
        send_ASCII_request_i : in STD_LOGIC; -- dane z asci_to_pseudographic ze chcemy cos wyswietlic
        send_ASCII_enable_o  : out STD_LOGIC := '1'
    );
end rs232_port_output;

architecture Behavioral of rs232_port_output is

    -- czas trwania jednego bitu (w cyklach zegara)
    constant bit_duration : integer := clk_freq / trans_speed;

    -- liczba bitów w jednostce danych (start + 8bit + stop)
    constant SDU_length : integer := 10;
    
    constant TXD_signal_idle : STD_LOGIC := '1';                -- if no data is transmitting, should be high state in TxD

    type TX_STATE is (NO_DATA, START, DATA, STOP);

    -- SYGNA?Y
    signal state         : TX_STATE := NO_DATA;
    signal bit_time_cnt  : integer range 1 to bit_duration := 1; -- licznik trwania bitu
    signal bit_cnt       : integer range 0 to 7 := 0; -- licznik bitów danych
    signal SDU_reg       : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- rejestr danych
    signal TXD_reg       : STD_LOGIC := '1'; -- wyj?cie transmisji

begin

    TXD_o <= TXD_reg;

    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            -- reset
            state <= NO_DATA;
            bit_time_cnt <= 1;
            bit_cnt <= 0;
            SDU_reg <= (others => '0');
            TXD_reg <= TXD_signal_idle;
            send_ASCII_enable_o <= '1';

        elsif rising_edge(clk_i) then
            send_ASCII_enable_o <= '0';

            case state is
                when NO_DATA =>
                    TXD_reg <= TXD_signal_idle;
                    bit_cnt <= 0;
                    bit_time_cnt <= 1;

                    if send_ASCII_request_i = '1' then
                        -- zapisz dane do rejestru
                        SDU_reg <= send_ASCII_i;
                        state <= START;
                        send_ASCII_enable_o <= '0';
                    else
                        send_ASCII_enable_o <= '1';
                    end if;

                when START =>
                    TXD_reg <= '0'; -- bit startu
                    if bit_time_cnt = bit_duration then
                        bit_time_cnt <= 1;
                        state <= DATA;
                        bit_cnt <= 0;
                    else
                        bit_time_cnt <= bit_time_cnt + 1;
                    end if;

                when DATA =>
                    TXD_reg <= SDU_reg(bit_cnt); --wysylany bit nr bit_cnt

                    if bit_time_cnt = bit_duration then
                        bit_time_cnt <= 1;
                        if bit_cnt = 7 then
                            state <= STOP;
                        else
                            bit_cnt <= bit_cnt + 1; --przejscie do kolejnego bitu
                        end if;
                    else
                        bit_time_cnt <= bit_time_cnt + 1;
                    end if;

                when STOP =>
                    TXD_reg <= '1'; -- bit stopu
                    if bit_time_cnt = bit_duration then --wyslane wszystkie bity
                        bit_time_cnt <= 1;
                        state <= NO_DATA;
                        send_ASCII_enable_o <= '1';
                    else
                        bit_time_cnt <= bit_time_cnt + 1;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;
