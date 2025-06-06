library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is

    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           button_i : in STD_LOGIC_VECTOR (3 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end top;

architecture Behavioral of top is

  component kcpsm6 
  generic(                 hwbuild : std_logic_vector(7 downto 0) := X"00";
                  interrupt_vector : std_logic_vector(11 downto 0) := X"3FF";
           scratch_pad_memory_size : integer := 64);
  port (                   address : out std_logic_vector(11 downto 0);
                       instruction : in std_logic_vector(17 downto 0);
                       bram_enable : out std_logic;
                           in_port : in std_logic_vector(7 downto 0);
                          out_port : out std_logic_vector(7 downto 0);
                           port_id : out std_logic_vector(7 downto 0);
                      write_strobe : out std_logic;
                    k_write_strobe : out std_logic;
                       read_strobe : out std_logic;
                         interrupt : in std_logic;
                     interrupt_ack : out std_logic;
                             sleep : in std_logic;
                             reset : in std_logic;
                               clk : in std_logic);
end component;

  component program
	generic(
		C_FAMILY : string := "7S";
		C_RAM_SIZE_KWORDS : integer := 1;
		C_JTAG_LOADER_ENABLE : integer := 0);
	Port (
 		address : in std_logic_vector(11 downto 0);
 		instruction : out std_logic_vector(17 downto 0);
 		enable : in std_logic;
 		rdl : out std_logic;
 		clk : in std_logic);
end component;

component display is
	Generic (clk_ratio : integer := 100_000);
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR (31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component hex2seg is
    Port ( hex_i : in STD_LOGIC_VECTOR (3 downto 0);
           seg_o : out STD_LOGIC_VECTOR (7 downto 0);
           bypas : in STD_LOGIC
           );
end component;

component sig_acc is
	Generic (value : unsigned(31 downto 0));
    Port ( clk_i : in STD_LOGIC;
           sig_i : in STD_LOGIC;
           sig_o : out STD_LOGIC);
end component;

component clk_div is
	Generic(divisior : integer);
    Port ( clk_i : in STD_LOGIC;
    		rst_i : in STD_LOGIC;
           clk_o : out STD_LOGIC);
end component;

signal         address : std_logic_vector(11 downto 0);
signal     instruction : std_logic_vector(17 downto 0);
signal     bram_enable : std_logic;
signal         in_port : std_logic_vector(7 downto 0);
signal        out_port : std_logic_vector(7 downto 0);
signal         port_id : std_logic_vector(7 downto 0);
signal    write_strobe : std_logic;

--
-- Some additional signals are required if your system also needs to reset KCPSM6. 
--

signal       cpu_reset : std_logic;
signal             rdl : std_logic;

--
-- When interrupt is to be used then the recommended circuit included below requires 
-- the following signal to represent the request made from your system.
--

signal     int_request : std_logic;

signal deb_buttons : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal digit_i : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal seg_i : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal mode_switch : STD_LOGIC := '0';
signal current_mode : STD_LOGIC := '0';
signal current_digit : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal bypas_signal : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal blink_clk : STD_LOGIC := '0';
signal do_blink : STD_LOGIC := '0';
signal khz_clk : STD_LOGIC := '0';
begin

	khz_clk_divc: clk_div 
		generic map(
			divisior => 100000
		)
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			clk_o => khz_clk
		);
		
	blink_clk_divc: clk_div 
		generic map(
			divisior => 800
		)
		port map(
			clk_i => khz_clk,
			rst_i => rst_i,
			clk_o => blink_clk
		);

	mode_swc: sig_acc generic map(value => to_unsigned(50000000, 32))
	port map(
	clk_i => clk_i,
	sig_i => button_i(3),
	sig_o => mode_switch
);

	btndb1c: sig_acc generic map(value => to_unsigned(2000000, 32))
	port map(
		clk_i => clk_i,
		sig_i => button_i(0),
		sig_o => deb_buttons(0)
	);
	
	btndb2c: sig_acc generic map(value => to_unsigned(2000000, 32))
	port map(
		clk_i => clk_i,
		sig_i => button_i(1),
		sig_o => deb_buttons(1)
	);
	
	btndb3c: sig_acc generic map(value => to_unsigned(2000000, 32))
	port map(
		clk_i => clk_i,
		sig_i => button_i(2),
		sig_o => deb_buttons(2)
	);
	
	btndb4c: sig_acc generic map(value => to_unsigned(2000000, 32))
	port map(
		clk_i => clk_i,
		sig_i => button_i(3),
		sig_o => deb_buttons(3)
	);

	bit0_h2sc: hex2seg port map(
		hex_i => digit_i(15 downto 12),
		seg_o => seg_i(31 downto 24),
		bypas => bypas_signal(0)
	);
	
	bit1_h2sc: hex2seg port map(
		hex_i => digit_i(11 downto 8),
		seg_o => seg_i(23 downto 16),
		bypas => bypas_signal(1)
	);
	
	bit2_h2sc: hex2seg port map(
		hex_i => digit_i(7 downto 4),
		seg_o => seg_i(15 downto 8),
		bypas => bypas_signal(2)
	);
	
	bit3_h2sc: hex2seg port map(
		hex_i => digit_i(3 downto 0),
		seg_o => seg_i(7 downto 0),
		bypas => bypas_signal(3)
	);

	displayc: display port map(
		clk_i => clk_i,
		rst_i => rst_i,
		digit_i => seg_i,
		led7_an_o => led7_an_o ,
		led7_seg_o => led7_seg_o
	);

  processor: kcpsm6
  generic map (                 hwbuild => X"00", 
                       interrupt_vector => X"7FF",
                scratch_pad_memory_size => 64)
  port map(      address => address,
             instruction => instruction,
             bram_enable => bram_enable,
                 port_id => port_id,
            write_strobe => write_strobe,
          k_write_strobe => open,
                out_port => out_port,
             read_strobe => open,
                 in_port => in_port,
               interrupt => '0',
           interrupt_ack => open,
                   sleep => '0',
                   reset => rst_i,
                     clk => clk_i);



  program_rom: program                 --Name to match your PSM file
	   generic map(
	       C_FAMILY => "7S",           --Family 'S6', 'V6' or '7S'
		   C_RAM_SIZE_KWORDS => 2,     --Program size '1', '2' or '4'
	       C_JTAG_LOADER_ENABLE => 0)  --Include JTAG Loader when set to '1' 
	   port map(      
	       address => address,      
		   instruction => instruction,
		   enable => bram_enable,
		   rdl => open,
		   clk => clk_i);

    input_ports:
    process
    begin
	   wait until rising_edge(clk_i);
		in_port <= "000" & mode_switch & deb_buttons;
	end process input_ports;

	output_ports: 
    process(clk_i, rst_i)
    begin
	   if rst_i = '1' then
            digit_i(15 downto 12) <= (others => '0');
            digit_i(11 downto 8) <= (others => '0');
            digit_i(7 downto 4) <= (others => '0');
            digit_i(3 downto 0) <= (others => '0');
            current_mode <= '0';
        elsif rising_edge (clk_i) then
        
            if write_strobe = '1' then
                if port_id(0) = '1' then
                    digit_i(15 downto 12) <= out_port(3 downto 0);
                end if;
                if port_id(1) = '1' then
                    digit_i(11 downto 8) <=out_port(3 downto 0);
                end if;
                if port_id(2) = '1' then
                    digit_i(7 downto 4) <= out_port(3 downto 0);
                end if;
                if port_id(3) = '1' then
                    digit_i(3 downto 0) <= out_port(3 downto 0);
                end if;
                if port_id(4) = '1' then
                    current_mode <= out_port(4);
                    case out_port(1 downto 0) is
                        when "00" =>
                             current_digit <= "0001";
                        when "01" =>
                             current_digit <= "0010";
                        when "10" =>
                             current_digit <= "0100";
                        when "11" =>
                             current_digit <= "1000";
                    end case;
                end if;
            end if;
		end if;
	end process output_ports;
	
	do_blink <= blink_clk and current_mode;
	bypas_signal <= current_digit and do_blink & do_blink & do_blink & do_blink;

end Behavioral;
