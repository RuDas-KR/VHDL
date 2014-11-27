----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:04 10/22/2009 
-- Design Name: 
-- Module Name:    Seg_Dis - Behavioral 
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

entity Seg_Dis is
	port (
				DIN   : in std_logic_vector (7 downto 0);	-- ASCII Data
				DIGIT : out std_logic_vector (6 downto 1);
				SEG   : out std_logic_vector (7 downto 0)
				);
end Seg_Dis;

architecture Behavioral of Seg_Dis is

begin

	process(DIN)
	begin
		case DIN is
									       -- abcdefgdp	
			when X"30" => SEG <= "11111100";--0
			when X"31" => SEG <= "01100000";--1
			when X"32" => SEG <= "11011010";--2
			when X"33" => SEG <= "11110010";--3
			when X"34" => SEG <= "01100110";--4
			when X"35" => SEG <= "10110110";--5
			when X"36" => SEG <= "10111110";--6
			when X"37" => SEG <= "11100100";--7
			when X"38" => SEG <= "11111110";--8
			when X"39" => SEG <= "11110110";--9
			when X"41" => SEG <= "11111010";--a
			when X"42" => SEG <= "00111110";--b
			when X"43" => SEG <= "10011100";--c
			when X"44" => SEG <= "01111010";--d
			when X"45" => SEG <= "10011110";--e
			when X"46" => SEG <= "10001110";--f
			when others => SEG <= (others => '0');
		end case;
	end process;

DIGIT <= "100000";

end Behavioral;

