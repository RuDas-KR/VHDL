----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:56:45 02/26/2010 
-- Design Name: 
-- Module Name:    cnt_10 - Behavioral 
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

entity cnt_10 is
    Port ( clk_in : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk_out : out  STD_LOGIC);
end cnt_10;

architecture Behavioral of cnt_10 is
signal tq : std_logic_vector(3 downto 0);
begin
q <= tq;
clk_out <= not tq(3);
process(clk_in, tq, rst)
begin
	if rst = '0' then
		tq <= (others => '0');
		elsif clk_in'event and clk_in = '1' then
			if tq = "1001" then
				tq <= (others => '0');
				else
				tq <= tq + '1';
			end if;
	end if;
end process;
end Behavioral;

