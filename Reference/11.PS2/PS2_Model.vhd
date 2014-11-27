----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:33 10/22/2009 
-- Design Name: 
-- Module Name:    PS2_Model - Behavioral 
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

entity PS2_Model is
	port (
				RSTB     : in std_logic;
				CLK      : in std_logic;
				PS2_CLK  : out std_logic;
				PS2_DATA : out std_logic
				);				
end PS2_Model;

architecture Behavioral of PS2_Model is

type key_state is (s0,s1,s2,s3);
signal state : key_state;

signal key_count : std_logic_vector (7 downto 0);
signal tx_data   : std_logic_vector (7 downto 0);
signal dcnt      : std_logic_vector (3 downto 0);
signal make_code : std_logic_vector (7 downto 0);

begin

	process(RSTB,CLK)
	begin
		if (RSTB = '0') then
			state <= s0;
		elsif rising_edge (CLK) then
			if (state = s0) then
				state <= s1;
			elsif (state = s1) then
				state <= s2;
			elsif (state = s2) then
				if (key_count = X"8") then
					state <= s3;
				else
					state <= s2;
				end if;
			elsif (state = s3) then
				state <= s0;
			end if;
		end if;
	end process;
	
	process(RSTB,CLK)
	begin
		if (RSTB = '0') then
			 dcnt <= (others => '0');
		elsif rising_edge (CLK) then
			if (state = s3) then
				dcnt <= dcnt + 1;
			else
				dcnt <= dcnt;
			end if;
		end if;
	end process;
	
make_code <= X"45" when dcnt = X"0" else
						X"16" when dcnt = X"1" else
						X"1e" when dcnt = X"2" else
						X"26" when dcnt = X"3" else
						X"25" when dcnt = X"4" else
						X"2e" when dcnt = X"5" else
						X"36" when dcnt = X"6" else
						X"3d" when dcnt = X"7" else
						X"3e" when dcnt = X"8" else
						X"46" when dcnt = X"9" else
						X"1c" when dcnt = X"a" else
						X"32" when dcnt = X"b" else
						X"21" when dcnt = X"c" else
						X"23" when dcnt = X"d" else
						X"24" when dcnt = X"e" else
						X"2b" when dcnt = X"f" else
						(others => '0');
							
	process(RSTB,CLK)
	begin
		if (RSTB = '0') then
			key_count <= (others => '0');
			tx_data <= (others => '0');
			tx_data <= X"16";
		elsif rising_edge (CLK) then
			if (state = s1) then
				tx_data <= make_code;
			elsif (state = s2) then
				if (key_count = X"8") then
					key_count <= (others => '0');
					tx_data <= tx_data;
				else
					key_count <= key_count + 1;
					tx_data <= tx_data(6 downto 0) & tx_data(7);
				end if;
			else
				key_count <= (others => '0');
				tx_data <= tx_data;
			end if;
		end if;
	end process;

	process(RSTB,CLK)
	begin
		if (RSTB = '0') then
			PS2_DATA <= '1';
		elsif rising_edge (CLK) then
			if (state = s0) then
				PS2_DATA <= '1';
			elsif (state = s1) then
				PS2_DATA <= '0';
			elsif (state = s2) then
				PS2_DATA <= tx_Data(7);
			elsif (state = s3) then
				PS2_DATA <= '1';
			else
				PS2_DATA <= '1';
			end if;
		end if;
	end process;
	
	PS2_CLK <= not CLK;	
	
end Behavioral;

