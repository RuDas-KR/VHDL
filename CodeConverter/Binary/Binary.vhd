
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Binary is
    Port ( binary_in : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           binary_out : out  STD_LOGIC_VECTOR (3 DOWNTO 0)
			  );
end Binary;

architecture Behavioral of Binary is

begin
	process (binary_in)
	begin
		case (binary_in) is
			when "0000" => binary_out <= "0000";
			when "0001" => binary_out <= "0001";
			when "0010" => binary_out <= "0010";
			when "0011" => binary_out <= "0011";
			when "0100" => binary_out <= "0100";
			when "0101" => binary_out <= "0101";
			when "0110" => binary_out <= "0110";
			when "0111" => binary_out <= "0111";
			when "1000" => binary_out <= "1000";
			when "1001" => binary_out <= "1001";
			when "1010" => binary_out <= "1010";
			when others => binary_out <= "1011";
		end case;
	end process;
	
end Behavioral;

