----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gray is
	port	(	binary_in : in STD_LOGIC_VECTOR (3 DOWNTO 0);
				gray_out : out STD_LOGIC_VECTOR (3 DOWNTO 0)
				);				
end gray;

architecture Behavioral of gray is

begin

	gray_out(3) <= binary_in(3);
	gray_out(2) <= binary_in(2) xor binary_in(3);
	gray_out(1) <= binary_in(1) xor binary_in(2);
	gray_out(0) <= binary_in(0) xor binary_in(1);

end Behavioral;

