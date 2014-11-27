----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:30 10/21/2009 
-- Design Name: 
-- Module Name:    Decoder_3to8 - Behavioral 
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

entity Decoder_3to8 is
 port ( 
 				A : in std_logic;
				B : in std_logic;
				C : in std_logic;
				D : out std_logic_vector (7 downto 0)
				);
end Decoder_3to8;

architecture Behavioral of Decoder_3to8 is

begin

 D <= "00000001" when (A='0' and B='0' and C='0') else
      "00000010" when (A='0' and B='0' and C='1') else
			"00000100" when (A='0' and B='1' and C='0') else
			"00001000" when (A='0' and B='1' and C='1') else
			"00010000" when (A='1' and B='0' and C='0') else
			"00100000" when (A='1' and B='0' and C='1') else
			"01000000" when (A='1' and B='1' and C='0') else
			"10000000" when (A='1' and B='1' and C='1') else
      (others => '0');

end Behavioral;

