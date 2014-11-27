----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:32:11 10/16/2009 
-- Design Name: 
-- Module Name:    TFF - Behavioral 
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

entity TFF is
    Port ( RST : in  STD_LOGIC;
           T 	 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           q 	 : out  STD_LOGIC);
end TFF;

architecture Behavioral of TFF is

	signal q_i : std_logic;

begin

	process(RST, CLK)
	begin
		if RST = '0' then
			q_i <= '0';
		elsif rising_edge(CLK) then
			if T = '1' then
				q_i <= not q_i;
			else
				q_i <= q_i;
			end if;
		end if;
	end process;
	
	q <= q_i;

end Behavioral;

