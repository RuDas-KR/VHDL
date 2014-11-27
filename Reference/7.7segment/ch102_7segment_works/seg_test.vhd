----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:58 12/21/2009 
-- Design Name: 
-- Module Name:    seg_test - Behavioral 
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

entity seg_test is
    Port ( digit : out  STD_LOGIC_VECTOR (5 downto 0);
           seg   : out  STD_LOGIC_VECTOR (7 downto 0));
end seg_test;

architecture Behavioral of seg_test is

begin

digit <= "111111";
seg   <= "11011011";

end Behavioral;

