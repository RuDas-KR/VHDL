----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:18:21 02/26/2010 
-- Design Name: 
-- Module Name:    sync_counter - Behavioral 
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

entity sync_counter is
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           clk_100k : out  STD_LOGIC;
           clk_10k  : out  STD_LOGIC;
           clk_1k   : out  STD_LOGIC);
end sync_counter;

architecture Behavioral of sync_counter is
signal cnt_5    : integer range 0 to 5;
signal cnt_50   : integer range 0 to 50;
signal cnt_500  : integer range 0 to 500;
signal tmp_clk_100k  : std_logic;
signal tmp_clk_10k   : std_logic;
signal tmp_clk_1k    : std_logic;

begin

clk_100k <= tmp_clk_100k;
clk_10k  <= tmp_clk_10k;
clk_1k   <= tmp_clk_1k;

clock_1k : process(reset, clk)
begin
	if reset = '0' then
		cnt_500      <= 0;
		tmp_clk_1k   <= '0';
		elsif rising_edge(clk) then
			if cnt_500 = 499 then
				cnt_500 <= 0;
				tmp_clk_1k <= not tmp_clk_1k;
				else
				cnt_500 <= cnt_500 + 1;
			end if;
	end if;
end process clock_1k;

clock_10k : process(reset, clk)
begin
	if reset = '0' then
		cnt_50       <= 0;
		tmp_clk_10k  <= '0';
		elsif rising_edge(clk) then
			if cnt_50 = 49 then
				cnt_50 <= 0;
				tmp_clk_10k <= not tmp_clk_10k;
				else
				cnt_50 <= cnt_50 + 1;
			end if;
	end if;
end process clock_10k;

clock_100k : process(reset, clk)
begin
	if reset = '0' then
		cnt_5       <= 0;
		tmp_clk_100k  <= '0';
		elsif rising_edge(clk) then
			if cnt_5 = 4 then
				cnt_5 <= 0;
				tmp_clk_100k <= not tmp_clk_100k;
				else
				cnt_5 <= cnt_5 + 1;
			end if;
	end if;
end process clock_100k;

end Behavioral;

