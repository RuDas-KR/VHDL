----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:55:52 11/14/2014 
-- Design Name: 
-- Module Name:    random0_9 - Behavioral 
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

entity random0_9 is
    Port ( x : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           BCD : out  STD_LOGIC_VECTOR (3 downto 0));
end random0_9;

architecture Behavioral of random0_9 is

begin
	process (x, rst,clk)
	variable counter: std_logic_vector (3 downto 0);
	begin
		if (rst = '0') then
			BCD <= "0000";
			counter := "0000";
		elsif (rising_edge(clk)) then
			if (counter = "1001") then
				counter := "0000";
			else
				counter := counter + 1;
			end if;
			if (x = '1') then
				BCD <= counter;
			end if;
		end if;
	end process;
end Behavioral;