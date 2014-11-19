library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity LED_8 is
    Port ( Q : in std_logic_vector(3 downto 0);
           LED : out std_logic_vector(7 downto 0));
end LED_8;
architecture Behavioral of LED_8 is
begin   
    with Q SELect
   LED <= "10000000" when "0001",   --1
          "00000010" when "0010",   --2
          "01000000" when "0011",   --3
          "00000100" when "0100",   --4
          "00100000" when "0101",   --5
          "00001000" when "0110",   --6
          "00010000" when "0111",   --7
          "00001000" when "1000",   --8
          "00010000" when "1001",   --9
          "00000100" when "1010",   --A
          "00100000" when "1011",   --b
          "00000010" when "1100",   --C
          "01000000" when "1101",   --d
          "00000001" when "1110",   --E
          "10000000" when "1111",   --F
          "00000001" when others;   --0
end Behavioral;