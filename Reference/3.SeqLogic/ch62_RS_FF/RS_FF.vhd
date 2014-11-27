----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:11 10/15/2009 
-- Design Name: 
-- Module Name:    RS_FF - Behavioral 
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

entity RS_FF is
			Port(	RST, R, S, CP	: in std_logic;
						q, qb					: out std_logic	);
end RS_FF;

architecture Behavioral of RS_FF is

	signal q_i, qb_i : std_logic;

begin

	process(R, S, CP, RST)
	begin
				if (RST = '0' )then
					q_i  <= '0';
					qb_i <= '1';
				elsif rising_edge(CP) then
						if (S='0' and R='0') then
									q_i  <= q_i;
					 				qb_i <= qb_i;
					 	elsif (S='0' and R='1') then
					 				q_i  <= '0';
									qb_i <= '1';
						elsif (S='1' and R='0') then
					 				q_i  <= '1';
									qb_i <= '0';
						end if;
				end if;
	end process;
	
	q  <= q_i;
	qb <= qb_i;
	

end Behavioral;



