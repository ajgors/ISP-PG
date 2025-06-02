library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--Typowa ramka VGA 640x480 sklada sie z:
	--Widocznych pikseli (visible area) - co widac na ekranie.
	--Okresów synchronizacji i pustych przestrzeni: front porch, sync pulse, back porch.

--Kazda linia i ramka sklada sie z:
	--horizontally: front -> sync -> back -> visible area
	--vertically: front-> sync -> back -> visible area


--Szerokosc linii:
--visible (640) + front (16) + sync (96) + back (48) = 800 pikseli zegarowych

--Wysokosc ramki:
--visible (480) + front (10) + sync (2) + back (33) = 525 linii


--Front Porch - chwila miedzy koncem ostatniego widocznego piksela a impulsem synchronizacji.
--Sync Pulse - krotki impuls sygnalizujacy koniec linii (ustawia "nastepna linia").
--Back Porch - czas, ktory pozwala elektronice monitora "zresetowac sie" przed rozpoczeciem rysowania kolejnej linii.
--Visible Area - piksele, ktore faktycznie widzisz na ekranie.

entity transmitter is
	Generic (
		-- tryb 640x460
		-- http://tinyvga.com/vga-timing/640x480@60Hz
		-- Horizontal timing (line)
		h_vis : integer := 640-1;    -- szerokosc widoczna (640 pikseli)
		h_front: integer := 16-1;    -- front porch (po obszarze widocznym)
		h_sync: integer := 96-1;     -- impuls synchronizacji poziomej
		h_back: integer := 48-1;     -- back porch (przed obszarem widocznym)
		
		v_vis: integer := 480-1;     -- wysokosc widoczna
		v_front: integer := 10-1;    -- front porch (po widocznym obszarze pionowym)
		v_sync: integer := 2-1;      -- impuls synchronizacji pionowej
		v_back: integer := 33-1;     -- back porch
		
		-- Rozmiar kwadratu wyswietlanego na srodku
		size_x: integer := 384; 
		size_y: integer := 384
	);
    Port ( clk : in STD_LOGIC; -- pixel, clock (25MHz)
           pixel_value : in STD_LOGIC; 						-- watosc pixela do wypisania na ekran
           pixel_addr : out STD_LOGIC_VECTOR (17 downto 0); -- adres pixela do odczytania (wyjscie)
           red_o : out STD_LOGIC_VECTOR (3 downto 0);
           green_o : out STD_LOGIC_VECTOR (3 downto 0);
           blue_o : out STD_LOGIC_VECTOR (3 downto 0);
           hsync_o : out STD_LOGIC;
           vsync_o : out STD_LOGIC
           );
end transmitter;

architecture Behavioral of transmitter is

	-- srodek ramki VGA, zeby wysrodkowac kwadrat 384x384
	constant h_vis_front : integer := (h_vis - size_x) / 2; --127.5
	constant h_vis_back : integer := (h_vis - size_x) / 2 + (h_vis - size_x + 1) mod 2; --127.5
	constant h_vis_x : integer := size_x - 1; --384-1
	constant h_vis_y : integer := size_y - 1; -- 384-1
	
	constant v_vis_front : integer := (v_vis - size_y) / 2; -- 47.5
	constant v_vis_back : integer := (v_vis - size_y) / 2 + (v_vis - size_y + 1) mod 2; -- 47.5
	
	type TRState is (front_vis, vis_area, back_vis, front, sync, back);

	-- ** SIGNALS **
	
	-- stany generatora sygnalow (front, sync, back, visible...).
	signal h_state : TRState := sync;
	signal v_state : TRState := sync;
	
	-- liczniki pozycji w poziomie i pionie.
	signal v_counter : integer := 0;
	signal h_counter : integer := 0;
	
	-- Aktywnosc piksela (czy należy go wyswietlic)
	signal pixel_en : STD_LOGIC := '0';

begin

	process 
	variable tmp: integer := 0;
	begin
	wait until rising_edge(clk);
		
		-- Zwieksz licznik wierszy na koncu linii
		if(h_counter >= h_back) and h_state = back then
			v_counter <= v_counter + 1;
		end if;
		
		h_counter <= h_counter + 1; -- zwieksz licznik pikseli (horyzontalnie)
		pixel_en <= pixel_value; 	-- zapamietaj wartosc piksela z RAM


		-- steruje pozycja piksela w linii
		case h_state is
			when front_vis => -- visible area, obszar przed kwadratem
				if(h_counter >= h_vis_front) then
					h_counter <= 0;
					tmp := (v_counter * 384) + 0; -- pierwszy piksel w wierszu
					pixel_addr <= std_logic_vector(to_unsigned(tmp, 18));
					h_state <= vis_area; -- przejdz do rysowania
				end if;
				
			when vis_area => -- obszar kwadratu
				if(h_counter >= h_vis_x) then
					h_counter <= 0;
					h_state <= back_vis; -- koniec widocznego obszaru
				elsif(h_counter + 1 < h_vis) then
					tmp := (v_counter * 384) + h_counter + 1;
					pixel_addr <= std_logic_vector(to_unsigned(tmp, 18)); -- adres kolejnego piksela
				end if;
			
			when back_vis =>
				if(h_counter >= h_vis_back) then -- obszar po kwadracie
					h_counter <= 0;
					h_state <= front;
				end if;
				
			when front =>
				if(h_counter >= h_front) then -- front porch
					h_counter <= 0;
					h_state <= sync;
				end if;
				
			when sync =>
				if(h_counter >= h_sync) then -- sync pulse
					h_counter <= 0;
					h_state <= back;
				end if;
				
			when back =>
				if(h_counter >= h_back) then -- back porch
					h_counter <= 0;
					h_state <= front_vis;
				end if;
		end case;
		
		
		-- steruje pozycja linii
		case v_state is
			when front_vis =>
				if(v_counter >= v_vis_front) then -- visible area, obszar nad kwadratem
					v_counter <= 0;
					v_state <= vis_area;
				end if;
				
			when vis_area =>
				if(v_counter >= h_vis_y) then -- obszar kwadratu
					v_counter <= 0;
					v_state <= back_vis;
				end if;
				
			when back_vis =>
				if(v_counter >= v_vis_back) then -- obszar pod kwadratem
					v_counter <= 0;
					v_state <= front;
				end if;
				
			when front =>
				if(v_counter >= v_front) then -- front porch
					v_counter <= 0;
					v_state <= sync;
				end if;
				
			when sync =>
				if(v_counter >= v_sync) then -- sync pulse
					v_counter <= 0;
					v_state <= back;
				end if;
				
			when back =>
				if(v_counter >= v_back) then -- back porch
					v_counter <= 0;
					v_state <= front_vis;
				end if;
		end case;
		
	end process;
	
	-- Sygnaly synchronizacji VGA (aktywne niskim poziomem)
	hsync_o <= '0' when h_state = sync else '1';
	vsync_o <= '0' when v_state = sync else '1';
	
	-- Kolor piksela RGB = bialy (pelna jasnosc) gdy aktywny i w obszarze widocznym
	red_o <= "1111" when pixel_en = '1' and (h_state = vis_area) and (v_state = vis_area) else "0000";
	green_o <= "1111" when pixel_en = '1' and (h_state = vis_area) and (v_state = vis_area) else "0000";
	blue_o <= "1111" when pixel_en = '1' and (h_state = vis_area) and (v_state = vis_area) else "0000";

end Behavioral;
