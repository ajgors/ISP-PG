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
           Port ( clk_i : in STD_LOGIC; -- zegar 100MHz,
           RXD_i : in STD_LOGIC; -- wej?cie danych RS232,
           TXD_o : out STD_LOGIC; -- wyj?cie danych RS232,
           ld0 : out STD_LOGIC; -- wyj?cie sygnalizacji przepe?nienia bufora FIFO (LED LD0),
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0); -- wyj?cie steruj?ce anodami wy?wietlaczy LED,
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)); --wyj?cie steruj?ce segmentami wy?wietlaczy LED.
end top;

architecture Behavioral of top is
    -- SIGNALS
    signal rst_off : STD_LOGIC := '0'; -- wylonczony reset
    
    signal recv_data : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); --odebrane dane
    signal write_to_buffer_enable : STD_LOGIC := '0'; -- flaga czy mozna pisac do bufora
    
    signal read_data : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); -- dane odebrane z fifo
    signal read_from_buffer_enable : STD_LOGIC := '0'; -- flaga czy czytac z bufora
    
    signal is_buffer_empty : STD_LOGIC := '1';
    signal is_buffer_full : STD_LOGIC := '0';
    
    signal send_data : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); -- dane do przeslania
    signal send_data_enable : STD_LOGIC := '1'; -- flaga czy mozna przeslac
    signal send_data_request : STD_LOGIC := '0'; -- request do przeslania
    
    signal display_hex_value : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); -- dane do wyswietlenia na display
    

-- COMPONENTS
    COMPONENT rs232_port_input
      PORT ( 
        clk_i : IN STD_LOGIC;
        rst_i : IN STD_LOGIC;
        RXD_i : IN STD_LOGIC;
        recv_ASCII_o : OUT STD_LOGIC_VECTOR (7 downto 0);
        recv_ASCII_enable_o : OUT STD_LOGIC
      );
    END COMPONENT;
    
     COMPONENT rs232_port_output
      PORT ( 
        clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        TXD_o : out STD_LOGIC;
        send_ASCII_i : in STD_LOGIC_VECTOR (7 downto 0);
        send_ASCII_request_i : in STD_LOGIC;
        send_ASCII_enable_o : out STD_LOGIC
      );
    END COMPONENT;

 COMPONENT display
      PORT ( 
        clk_i : in STD_LOGIC;                               
        rst_i : in STD_LOGIC;                               
        hex_value_i : in STD_LOGIC_VECTOR (15 downto 0);   
        dots_i : in STD_LOGIC_VECTOR (3 downto 0);         
        enabling_flags_i : in STD_LOGIC_VECTOR (3 downto 0);  
        led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);      
        led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)  
      );
    END COMPONENT;
    
    COMPONENT fifo_mem
      PORT (
        clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC 
      );
    END COMPONENT;
    
    COMPONENT ascii_to_pseudographic
      PORT (
        clk_i : in STD_LOGIC;
        data_from_buffer_i : in STD_LOGIC_VECTOR (7 downto 0);
        is_buffer_empty_i : in STD_LOGIC;
        send_enable_i : in STD_LOGIC;
        send_request_o : out STD_LOGIC;
        data_to_send_o : out STD_LOGIC_VECTOR (7 downto 0);
        read_from_buffer_enable_o : out STD_LOGIC        
      );        
    END COMPONENT;
    
begin

  input_service : rs232_port_input
      PORT MAP (
        clk_i => clk_i,
        rst_i => rst_off,
        RXD_i => RXD_i,
        recv_ASCII_o => recv_data,
        recv_ASCII_enable_o => write_to_buffer_enable -- flaga czy mozna pisac do bufora
      );
      
    output_service : rs232_port_output
      PORT MAP (
        clk_i => clk_i,
        rst_i => rst_off,
        TXD_o => TXD_o,
        send_ASCII_i => send_data, --dane do wyslanai z ascii_to_pseudgraphic
        send_ASCII_request_i => send_data_request,
        send_ASCII_enable_o => send_data_enable
      );
      
    display_service : display
      PORT MAP (
        clk_i => clk_i,                             
        rst_i => rst_off,                               
        hex_value_i => display_hex_value,  -- input do wyswietlenia na plytce 8 bitow z inputu
        dots_i => "0000",        
        enabling_flags_i => "0011", 
        led7_an_o => led7_an_o,     
        led7_seg_o => led7_seg_o 
      );
      
    data_buffer : fifo_mem
      PORT MAP (
        clk => clk_i,
        din => recv_data, --dane odebrane z inputu do fifo
        wr_en => write_to_buffer_enable, -- flaga czy mozna pisac do bufora
        rd_en => read_from_buffer_enable, -- flaga czy czytac z bufora
        dout => read_data, -- dane odczytywane z fifo
        full => is_buffer_full,
        empty => is_buffer_empty 
      );
      
     print_data_service : ascii_to_pseudographic
      PORT MAP (
        clk_i => clk_i,
        data_from_buffer_i => read_data, --dane odczytane  z fifo
        is_buffer_empty_i => is_buffer_empty,
        send_enable_i => send_data_enable,
        send_request_o => send_data_request,
        data_to_send_o => send_data, -- dane do wyslania przez rs232 port output
        read_from_buffer_enable_o => read_from_buffer_enable        
      );
      
    -- SIGNALS
    -- zapisanie odebranego bajtu do wyswietlenia
    display_hex_value (7 downto 0) <= recv_data;

    -- PROCESS
    -- Pzepe?nienie bufora (zapalenie diody LD0)
    OVERFLOW_GUARD:
    process (clk_i)
    begin
        if rising_edge(clk_i) then
        
            if is_buffer_full = '1' and write_to_buffer_enable = '1' then
                ld0 <= '1';
            end if;
            
            if is_buffer_full = '0' then
                ld0 <= '0';   
            end if;
            
        end if;
    end process;


end Behavioral;