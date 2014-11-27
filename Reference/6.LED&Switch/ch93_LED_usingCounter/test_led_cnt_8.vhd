----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:10 12/21/2009 
-- Design Name: 
-- Module Name:    test_led_cnt_8 - Behavioral 
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

entity test_led_cnt_8 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end test_led_cnt_8;

architecture Behavioral of test_led_cnt_8 is
signal tmp : std_logic_vector(25 downto 0);
begin
process(clk, rst, tmp)
begin
	if rst = '0' then
		tmp <= (others => '0');
		elsif rising_edge(clk) then
			if tmp = "10111110101111000010000000" then
				tmp <= (others => '0');
				else
				tmp <= tmp + '1';
			end if;
	end if;
end process;

led <= tmp (25 downto 18);

end Behavioral;

