
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt_50m is
    Port ( aclr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (15 downto 0);
           clk_1khz : out  STD_LOGIC);
end cnt_50m;

architecture Behavioral of cnt_50m is
	constant CNT50M_MAX : std_logic_vector(15 downto 0):=x"C350";
														-- 0xC350 = 50000
	signal q_s : std_logic_vector (15 downto 0);

begin
	process(aclr, clk)
	begin
			if aclr='1' then
						q_s <= (others => '0');
						clk_1khz <= '0';
			elsif clk'event and clk='1' then
					if	q_s=(CNT50M_MAX - '1') then	
							q_s <= (others => '0');
							clk_1khz <= '1';
					else
						q_s <=q_s+ '1';
						clk_1khz <= '0';
					end if;
			end if;
	end process;
	q<=q_s;
end Behavioral;