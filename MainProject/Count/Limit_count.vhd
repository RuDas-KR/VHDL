----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:57 11/19/2014 
-- Design Name: 
-- Module Name:    Limit_count - Behavioral 
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

entity Limit_Count is
	port	(	push	:	in	STD_LOGIC_VECTOR (1 downto 0);
				digit	:	out	STD_LOGIC_VECTOR	(6 downto 1);
				seg_7	:	out	STD_LOGIC_VECTOR	(7	downto 0)
				);
end Limit_Count;

architecture Behavioral of Limit_Count is

begin
	process
		begin
		digit <= "000001";
			if (push="11") then seg_7 <= "01100110";
			else	seg_7	<=	"11111111";
			end if;
		end process;
end Behavioral;