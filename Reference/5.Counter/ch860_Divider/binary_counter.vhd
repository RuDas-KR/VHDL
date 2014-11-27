----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:54 02/26/2010 
-- Design Name: 
-- Module Name:    binary_counter - Behavioral 
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

entity binary_counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q   : out  STD_LOGIC_VECTOR(3 downto 0));
end binary_counter;

architecture Behavioral of binary_counter is
signal tq : std_logic_vector(3 downto 0);
begin
q <= tq;

process(clk, rst, tq)
begin
	if rst = '0' then
		tq <= (otehrs => '0');
		elsif rising_edge(clk) then
			tq <= tq + '1';
	end if;
end process;
end Behavioral;

