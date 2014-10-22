library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cnt_10 is
    Port ( CLK : in std_logic;
           RST : in std_logic;
           Q : out std_logic_vector(3 downto 0)
			 );
end cnt_10;

architecture Behavioral of cnt_10 is
signal TMP_Q : std_logic_vector(3 downto 0);
begin
-- 1초 단위로 카운터가 증가한다.
process(RST, CLK, TMP_Q)
begin
if RST = '1' then
		--TMP_Q <= (others => '0');
		TMP_Q <= "0000";
	elsif rising_edge(CLK) then
		TMP_Q <= TMP_Q + 1;
end if;
end process;
Q <= TMP_Q;
end Behavioral;