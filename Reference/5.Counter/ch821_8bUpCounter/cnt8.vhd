----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:30:17 02/26/2010 
-- Design Name: 
-- Module Name:    cnt8 - Behavioral 
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

entity cnt8 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q   : out  STD_LOGIC_VECTOR (7 downto 0));
end cnt8;

architecture Behavioral of cnt8 is
signal tq : std_logic_vector(7 downto 0);
begin
Q <= tq;

process(clk, rst, tq)
begin
	if rst = '0' then
		tq <= (others => '0');
		elsif rising_edge(clk) then
			tq <= tq + '1';
	end if;
end process;

end Behavioral;

