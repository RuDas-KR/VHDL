library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEG_SCAN is
    Port ( CLK : in std_logic;
           RST : in std_logic;
           DIGIT : out std_logic_vector(5 downto 0));
end SEG_SCAN;

architecture Behavioral of SEG_SCAN is
signal tmp : std_logic_vector(2 downto 0);
begin
process(RST, CLK)
begin
if RST = '1' then
	tmp <= (others => '0');
elsif rising_edge(CLK) then
	tmp <= tmp + 1;
end if;
end process;

process(tmp)
begin
case tmp is
      when "000" => 
         DIGIT <= "000001";
      when "001" => 
         DIGIT <= "000010";
      when "010" => 
         DIGIT <= "000100";
      when "011" => 
         DIGIT <= "001000";
      when "100" => 
         DIGIT <= "010000";
      when "101" => 
         DIGIT <= "100000";
      when others =>
         DIGIT <= "000000";
   end case;
end process;

end Behavioral;