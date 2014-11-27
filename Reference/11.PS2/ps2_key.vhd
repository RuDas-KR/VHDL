----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:48 10/22/2009 
-- Design Name: 
-- Module Name:    ps2_key - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ps2_key is
	port (
				RSTB       : in std_logic;	-- Input Reset (Active Low)
				CLK        : in std_logic;	-- FPGA GCLK1 (100Mhz)
				KEY_CLK    : in std_logic;	-- PS/2 CLK
				KEY_DATA   : in std_logic;	-- PS/2 Data
				ASCII_DATA : out std_logic_vector (7 downto 0)	-- ASCII Code
				);				
end ps2_key;

architecture Behavioral of ps2_key is

component scan_rom
	port (
				clka: IN std_logic;
				addra: IN std_logic_VECTOR(6 downto 0);
				douta: OUT std_logic_VECTOR(7 downto 0)
				);
END component;

type key_state is (t0,t1,t2);
signal state : key_state;

signal key_count : std_logic_vector (3 downto 0);
signal shift_reg : std_logic_vector (11 downto 0);
signal data_reg  : std_logic_vector (7 downto 0);
signal scan_data : std_logic_vector (7 downto 0);
signal data      : std_logic_vector (7 downto 0);

begin

u_scan_rom : scan_rom
	port map (
				clka  => CLK,	
				addra => scan_data(6 downto 0),	
				douta => ASCII_DATA	  
				);

process(RSTB,KEY_CLK)	-- PS/2 key-input state machine
begin
	if (RSTB = '0') then
		key_count <= (others => '0');
		state <= t0;
--	elsif rising_edge (KEY_CLK) then
	elsif falling_edge (KEY_CLK) then
		if (state = t0 and KEY_DATA = '0') then
			key_count <= X"1";
			state <= t1;
		elsif (state = t1) then
			if (key_count = X"9") then
				key_count <= (others => '0');
				state <= t2;
			else
				key_count <= key_count + 1;
				state <= t1;
			end if;
		elsif (state = t2) then
			state <= t0;
			key_count <= (others => '0');
		end if;
	end if;
end process;


process(RSTB,KEY_CLK)	-- PS/2 key shift register
begin
	if (RSTB = '0') then
		shift_reg <= (others => '0');
		data_reg <= (others => '0');
--	elsif rising_edge (KEY_CLK) then
	elsif falling_edge (KEY_CLK) then
		if (state = t1) then
			shift_reg <= shift_reg(10 downto 0) & KEY_DATA;
		elsif (state = t2) then
			data_reg <= shift_reg(8 downto 1);
			shift_reg <= (others => '0');
		end if;
	end if;
end process;

scan_data(7) <= data_reg(0);
scan_data(6) <= data_reg(1);
scan_data(5) <= data_reg(2);
scan_data(4) <= data_reg(3);
scan_data(3) <= data_reg(4);
scan_data(2) <= data_reg(5);
scan_data(1) <= data_reg(6);
scan_data(0) <= data_reg(7);

end Behavioral;

