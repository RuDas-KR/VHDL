----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binarytobcd is
	port	(	binary_in : in STD_LOGIC_VECTOR (3 DOWNTO 0);
				BCD_out : out STD_LOGIC_VECTOR (5 DOWNTO 0)
				);
end binarytobcd;

architecture Behavioral of binarytobcd is

begin
	process (binary_in)
	begin
		case (binary_in) is
				when "0000" => BCD_out <= "000000";
				when "0001" => BCD_out <= "000001";
				when "0010" => BCD_out <= "000010";
				when "0011" => BCD_out <= "000011";
				when "0100" => BCD_out <= "000100";
				when "0101" => BCD_out <= "000101";
				when "0110" => BCD_out <= "000110";
				when "0111" => BCD_out <= "000111";
				when "1000" => BCD_out <= "001000"; -- 8
				when "1001" => BCD_out <= "001001"; -- 9
				when "1010" => BCD_out <= "010000"; -- 10
				when others => BCD_out <= "010001"; -- 11
		end case;
		
	end process;

end Behavioral;

