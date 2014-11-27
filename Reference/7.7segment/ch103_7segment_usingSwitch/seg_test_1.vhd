----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:56:20 12/21/2009 
-- Design Name: 
-- Module Name:    seg_test_1 - Behavioral 
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

entity seg_test_1 is
    Port ( push  : in  STD_LOGIC_VECTOR (3 downto 0);
           dip   : in  STD_LOGIC_VECTOR (7 downto 0);
           digit : out  STD_LOGIC_VECTOR (5 downto 0);
           seg   : out  STD_LOGIC_VECTOR (7 downto 0));
end seg_test_1;

architecture Behavioral of seg_test_1 is
signal tmp : std_logic_vector(11 downto 0);
begin
tmp <= push & dip;
digit <= "111111";
with tmp select
seg  <=  "01111001" when "100000000000",   --1
         "00100100" when "010000000000",   --2
         "00110000" when "001000000000",   --3
         "00011001" when "000100000000",   --4
         "00010010" when "000010000000",   --5
         "00000010" when "000001000000",   --6
         "01111000" when "000000100000",   --7
         "00000000" when "000000010000",   --8
         "00010000" when "000000001000",   --9
         "00001000" when "000000000100",   --A
         "00000011" when "000000000010",   --b
         "01000110" when "000000000001",   --C
         "01000000" when others;           --0

end Behavioral;

