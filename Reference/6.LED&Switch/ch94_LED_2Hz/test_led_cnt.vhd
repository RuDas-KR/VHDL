----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:39 12/21/2009 
-- Design Name: 
-- Module Name:    test_led_cnt - Behavioral 
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

entity test_led_cnt is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end test_led_cnt;

architecture Behavioral of test_led_cnt is
signal tmp      : std_logic_vector(25 downto 0);
signal case_tmp : std_logic_vector(2 downto 0);
signal en       : std_logic;
begin
process(clk, rst, tmp)
begin
	if rst = '0' then
		tmp <= (others => '0');
		en  <= '0';
		elsif rising_edge(clk) then
			if tmp = "10111110101111000010000000" then
				tmp <= (others => '0');
				en  <= '1';
				else
				tmp <= tmp + '1';
				en <= '0';
			end if;
	end if;
end process;

process(clk, rst, en)
begin
	if rst = '0' then
		case_tmp <= (others => '0');
		elsif rising_edge(clk) then
			if en = '1' then
				case_tmp <= "000";
				else
				case_tmp <= case_tmp + '1';
			end if;
	end if;
end process;

process(case_tmp)
begin
	case case_tmp is
		when "000" => led <= "00000001";
		when "001" => led <= "00000010";
		when "010" => led <= "00000100";
		when "011" => led <= "00001000";
		when "100" => led <= "00010000";
		when "101" => led <= "00100000";
		when "110" => led <= "01000000";
		when "111" => led <= "10000000";
		when others => led <= "00000000";
	end case;
end process;
end Behavioral;

