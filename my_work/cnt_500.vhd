
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt_500 is
    Port ( aclr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (8 downto 0);
           clk_2hz : out  STD_LOGIC);
end cnt_500;

architecture Behavioral of cnt_500 is
	constant CNT500_MAX : std_logic_vector(8 downto 0):="111110100";
														-- 0x1f4 = 500
	signal q_s : std_logic_vector (8 downto 0);


begin
	process(aclr,clk)
	begin
			if aclr='1' then
						q_s <= (others => '0');
						clk_2hz <= '0';
			elsif clk'event and clk='1' then
					if q_s=(CNT500_MAX - '1') then
								q_s <= (others => '0');
								clk_2hz <= '1';
					else
								q_s <= q_s + '1';
								clk_2hz <='0';
					end if;
			end if;
	end process;
	q <= q_s;
end Behavioral;