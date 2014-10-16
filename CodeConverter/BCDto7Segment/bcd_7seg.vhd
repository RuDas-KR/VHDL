library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_7seg is
    Port ( bcd : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
			  digit : out STD_LOGIC_VECTOR (6DOWNTO 1);
           s7segment : out  STD_LOGIC_VECTOR (7 DOWNTO 0)
			  );
end bcd_7seg;

architecture Behavioral of bcd_7seg is

begin
	digit <=B"00_0001";
	process(bcd)
	begin
		if		(bcd="00000000") then s7segment <=b"0011_1111";
		elsif (bcd="00000001") then s7segment <=b"0000_0110"; 
		elsif (bcd="00000010") then s7segment <=b"0101_1011"; 
		elsif (bcd="00000011") then s7segment <=b"0100_1111"; 
		elsif (bcd="00000100") then s7segment <=b"0110_0110"; 
		elsif (bcd="00000101") then s7segment <=b"0110_1101"; 
		elsif (bcd="00000110") then s7segment <=b"0111_1101"; 
		elsif (bcd="00000111") then s7segment <=b"0000_0111"; 
		elsif (bcd="00001000") then s7segment <=b"0111_1111"; 
		elsif (bcd="00001001") then s7segment <=b"0110_0111"; 
		
		elsif (bcd="00010000") then s7segment <=b"0101_1111"; 
		elsif (bcd="00010001") then s7segment <=b"0111_1100"; 
		elsif (bcd="00010010") then s7segment <=b"0011_1001"; 
		elsif (bcd="00010011") then s7segment <=b"0101_1110"; 
		elsif (bcd="00010100") then s7segment <=b"0111_1011"; 
		elsif (bcd="00010101") then s7segment <=b"0111_0001"; 
		else s7segment<=b"0000_0000";
		end if;
	end process;
end Behavioral;