library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ascii_to_pseudographic is

    Port (
            clk_i : in STD_LOGIC;
            data_from_buffer_i : in STD_LOGIC_VECTOR (7 downto 0); -- dane z bufora
            is_buffer_empty_i : in STD_LOGIC;
            send_enable_i : in STD_LOGIC;
            send_request_o : out STD_LOGIC := '0';
            data_to_send_o : out STD_LOGIC_VECTOR (7 downto 0);
            read_from_buffer_enable_o : out STD_LOGIC := '0'        
         );
         
end ascii_to_pseudographic;

architecture Behavioral of ascii_to_pseudographic is

    -- TYPES
    subtype T_ASCII is STD_LOGIC_VECTOR(7 DOWNTO 0); -- znak asci 8 bitow
    
    type T_PRINT_FRAME is array (NATURAL range <>) of T_ASCII; -- tablica znakow asci
    type T_STATE is ( -- stany
                        IDLE,
                        PREPARING_TO_READ,
                        READING,
                        PREPARING_ITERS,
                        GETTING_ITEM_ROW,
                        SENDING_ITEM_ROW_ELEMENT,
                        SENDING_CR,
                        SENDING_LF,
                        UPDATING_ITERS
                    );
    
    -- CONSTANTS
    constant ASCII_CR : T_ASCII := X"0D";       -- xOD = 13 = carriage return
    constant ASCII_LF : T_ASCII := X"0A";       -- xOA = 10 = line feed
    constant ASCII_space : T_ASCII := X"20";    -- x20 = 32 = space
    constant ASCII_asterisk : T_ASCII := X"2A"; -- x2A = 42 = *
    
    constant C_print_trigger_on_value : STD_LOGIC_VECTOR(7 DOWNTO 0) := ASCII_CR;
    
    constant C_print_frame_maxsize : INTEGER := 18;  -- max licza znakow
    constant C_font_cols_number : INTEGER := 8; -- szeroko?? znaku (8 pikseli)
    constant C_font_rows_number : INTEGER := 16; -- wysoko?? znaku (16 linii)

    -- FUNCTIONS
    -- bit obecno?ci na 1. spacje dla 0, 2. na kod asci dla 1
    -- dla ascii_code < 32 || 127 < ascii_code - wypisz gwiazdke
    -- ustawia dane do syslania na symbol asci lub gwiazdke
    function set_print_sign
    (
        font_bit: STD_LOGIC;
        ascii_code: T_ASCII
    )
    return T_ASCII
    is
        variable data_to_send : STD_LOGIC_VECTOR(7 DOWNTO 0);
    begin
        if (font_bit = '0') then
            data_to_send := ASCII_space; -- brak piksela -> spacja
        else
            if (ascii_code < X"20") or (ascii_code > X"7F") then   -- ascii_code < 32 || 127 < ascii_code
                data_to_send := ASCII_asterisk;
            else
                data_to_send := ascii_code;
            end if;
        end if;
        return (data_to_send);
    end function set_print_sign;
    
    
    -- SIGNALS    
    signal print_frame : T_PRINT_FRAME (0 to C_print_frame_maxsize-1) := (others => (others => '0')); --tablica 18 znakow ascii
    signal print_frame_size : INTEGER range 0 to C_print_frame_maxsize := 0; -- rozmiar tablicy znakow ascii
    
    signal address : STD_LOGIC_VECTOR (11 downto 0) := (others => '0'); -- adres ROM
    signal pseudographic_font_row : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); -- 1 wiersz (8 bitów) znaku

    signal state : T_STATE := IDLE;
    
    signal item_iter : INTEGER range 0 to C_print_frame_maxsize-1; -- indeks znaku w tablicy
    signal row_iter : INTEGER range 0 to C_font_rows_number-1; --aktualny wiersz 0-15
    signal col_iter : INTEGER range 0 to C_font_cols_number-1; --aktualna kolumna 0-7
    
    -- COMPONENTS
    COMPONENT char_memory
      PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
      );
    END COMPONENT;

begin
    
    font_lib : char_memory
    PORT MAP (
        clka => clk_i,
        addra => address,
        douta => pseudographic_font_row -- wektor 8 bajtow
    );
    
    -- PROCESSES
    CONVERTER:
    process (clk_i)
        variable is_send_request : STD_LOGIC := '0';

        variable read_fifo_latency_cnt : INTEGER := 0; --opoznienie fifo cnt
        variable read_rom_latency_cnt : INTEGER := 0; --opoznienie rom cnt
        
    begin
        if rising_edge(clk_i) then
            
            case state is
            
                -- STAN POCZ?TKOWY – czekanie na dane w buforze
                when IDLE =>                    
                    if (is_buffer_empty_i = '0') then
                        state <= PREPARING_TO_READ;
                    end if;
                    
                 -- AKTYWACJA SYGNA?U ODCZYTU Z BUFORA
                when PREPARING_TO_READ =>
                    read_from_buffer_enable_o <= '1';
                    
                    --dodanie opoznienia fifo 1 cycle
                    if (read_fifo_latency_cnt = 1) then
                        state <= READING;   -- read latency = 1 clock cycle
                        read_fifo_latency_cnt := 0;
                    else 
                        read_fifo_latency_cnt := read_fifo_latency_cnt + 1;
                    end if;
                    
                -- ODCZYT ZNAKÓW ASCII Z BUFORA
                when READING =>
                    if (data_from_buffer_i = C_print_trigger_on_value) then    -- je?li ENTER (kod 13)
                        read_from_buffer_enable_o <= '0';
                        
                        if (print_frame_size = 0) then -- pusty wiersz nic nie wypisujemy
                            is_send_request := '0';
                            send_request_o <= '0';
                            state <= IDLE;
                        else
                            state <= PREPARING_ITERS;
                        end if;
                        
                    else
                        -- dodanie znaku do tablicy znakow
                        print_frame(print_frame_size) <= data_from_buffer_i;  
                        print_frame_size <= print_frame_size + 1;
                        
                        -- osi?gni?to limit znaków C_print_frame_maxsize(=18)
                        if (print_frame_size = C_print_frame_maxsize-1) then 
                            read_from_buffer_enable_o <= '0'; -- nie odczytuj dalej
                            state <= PREPARING_ITERS;
                            
                        -- bufor si? opró?ni? - przerywamy
                        elsif (is_buffer_empty_i = '1') then
                            read_from_buffer_enable_o <= '0'; -- nie odczytuj dalej
                            state <= IDLE;
                            
                        end if;
                    end if;


                -- INICJALIZACJA ITERATORÓW
                when PREPARING_ITERS =>
                    item_iter <= 0;
                    row_iter <= 0;
                    col_iter <= 0;
                    state <= GETTING_ITEM_ROW;
                    
                -- USTAWIENIE ADRESU DO ROM – odczytujemy konkretny wiersz znaku
                when GETTING_ITEM_ROW =>
                -- Adres dla pami?ci ROM naj?atwiej jest wygenerowa? ??cz?c 8-bitowy wektor kodu znaku ASCII z 4-bitowym wektorem numeru linii w znaku (0-15) za pomoc? operatora &. 
                -- print_frame(item_iter)- znak asci aktualny
                -- conv_std_logic_vector(row_iter, 4) - aktualnie odczytywany wiersz
                    address <= print_frame(item_iter) & conv_std_logic_vector(row_iter, 4);
                    
                    --dodanie opoznienia rom 1 cycle
                    -- pseudographic_font_row - zainicjowany
                    if (read_rom_latency_cnt = 1) then
                        state <= SENDING_ITEM_ROW_ELEMENT;   -- read latency = 1 clock cycle
                        read_rom_latency_cnt := 0;
                    else 
                        read_rom_latency_cnt := read_rom_latency_cnt + 1;
                    end if;
                    
                -- wysylanie wiersza
                -- WYSY?ANIE ZNAKU RENDEROWANEGO Z LINII (1 bit => 1 znak ASCII)
                when SENDING_ITEM_ROW_ELEMENT =>
                    if (is_send_request = '0') and (send_enable_i = '1') then
                        send_request_o <= '1';
                        -- znak do wyslania 1. 0/1 czy spacja, 2. jaki znak asci
                        data_to_send_o <= set_print_sign( pseudographic_font_row((C_font_cols_number-1)-col_iter), print_frame(item_iter) );
                        is_send_request := '1';
                        
                    elsif (is_send_request = '1') then
                        is_send_request := '0';
                        send_request_o <= '0';
                        
                        if (col_iter = C_font_cols_number-1) and (item_iter = print_frame_size-1) then -- koniec wszystkich wierszow znakow (koniec lini)
                            state <= SENDING_CR;
                        else
                            state <= UPDATING_ITERS; -- przechodzimy do kolejnego znaku
                            
                        end if; 
                    end if;
                    
                -- WYSY?ANIE CR po zako?czeniu jednej linii
                when SENDING_CR =>
                    if (is_send_request = '0') and (send_enable_i = '1') then
                        send_request_o <= '1';
                        data_to_send_o <= ASCII_CR;
                        is_send_request := '1';
                        
                    elsif (is_send_request = '1') then
                        is_send_request := '0';
                        send_request_o <= '0';
                        state <= SENDING_LF;

                    end if;
                    
                -- WYSY?ANIE LF 
                when SENDING_LF =>
                    if (is_send_request = '0') and (send_enable_i = '1') then
                        send_request_o <= '1';
                        data_to_send_o <= ASCII_LF;
                        is_send_request := '1';
                        
                    elsif (is_send_request = '1') then
                        is_send_request := '0';
                        send_request_o <= '0';
                        state <= UPDATING_ITERS;  -- przechodzimy do kolejnego znaku
                    end if;
                    
                -- AKTUALIZACJA ITERATORÓW
                when UPDATING_ITERS =>
                    if (row_iter = C_font_rows_number-1) and (item_iter = print_frame_size-1) and (col_iter = C_font_cols_number-1) then --wypisalismy juz wszystko
                        row_iter <= 0;
                        item_iter <= 0;
                        col_iter <= 0;
                        print_frame_size <= 0;
                        state <= IDLE; --idziemy do stanu idle
                        
                    else
                    -- Je?li to by? ostatni znak w wierszu i ostatnia kolumna -> idziemy do kolejnego wiersza pseudograficznego
                        if (item_iter = print_frame_size-1) and (col_iter = C_font_cols_number-1) then
                            row_iter <= (row_iter + 1) mod C_font_rows_number; -- przejscie do kolejnego wiersza modulo 16
                        end if;
                        
                        --Je?li sko?czyli?my kolumny jednego znaku -> przechodzimy do kolejnego znaku w linii.
                        if (col_iter = C_font_cols_number-1) then
                            item_iter <= (item_iter + 1) mod print_frame_size; -- przejscie do kolejnego znaku ascii
                        end if;
                        
                        col_iter <= (col_iter + 1) mod C_font_cols_number; -- przejscie do kolejnej kolumny modulo 6
                        
                        state <= GETTING_ITEM_ROW; -- pobranie kolejnej lini
                        
                    end if;
            end case;
        end if;
    end process;
    
end Behavioral;