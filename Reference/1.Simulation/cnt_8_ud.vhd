----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:36 10/30/2009 
-- Design Name: 
-- Module Name:    cnt_8_ud - Behavioral 
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

entity cnt_8_ud is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en  : in  STD_LOGIC;
           q   : out  STD_LOGIC_VECTOR (7 downto 0));
end cnt_8_ud;

architecture Behavioral of cnt_8_ud is
signal tmp : std_logic_vector(7 downto 0);

begin
process(clk, rst, tmp)
begin
	if rst = '0' then
		tmp <= (others => '0');
		elsif rising_edge(clk) then
			if en = '1' then
				tmp <= tmp + '1';
				else
				tmp <= tmp - '1';
			end if;
	end if;
end process;
q <= tmp;
end Behavioral;
