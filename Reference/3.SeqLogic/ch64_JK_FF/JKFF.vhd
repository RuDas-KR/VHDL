----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:23 10/16/2009 
-- Design Name: 
-- Module Name:    JKFF - Behavioral 
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

entity JKFF is
    Port ( RST 	: in  STD_LOGIC;
           J 		: in  STD_LOGIC;
           K 		: in  STD_LOGIC;
           CLK 	: in  STD_LOGIC;
           q 		: out  STD_LOGIC);
end JKFF;

architecture Behavioral of JKFF is

	signal q_i : std_logic;

begin

	process(RST, CLK)
	begin
		if RST = '0' then
			q_i <= '0';
		elsif falling_edge(CLK) then
			if (J='0' and K='0') then
					q_i <= q_i;
			elsif (J='1' and K='0') then
						 q_i <= '1';
			elsif (J='0' and K='1') then
						 q_i <= '0';
			else
				q_i <= not q_i;
			end if;
		end if;
	end process;
	
	q <= q_i;
		
end Behavioral;

