----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:22 02/26/2010 
-- Design Name: 
-- Module Name:    cnt8e - Behavioral 
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

entity cnt8e is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en  : in  STD_LOGIC;
           q   : out  STD_LOGIC_VECTOR (7 downto 0));
end cnt8e;

architecture Behavioral of cnt8e is
signal tq : std_logic_vector(7 downto 0);
begin
q <= tq;
process(clk, rst, tq)
begin
	if rst = '0' then
		tq <= (others => '0');
		elsif rising_edge(clk) then
			if (en = '1') then
				tq <= tq + '1';
			end if;
	end if;
end process;
end Behavioral;

