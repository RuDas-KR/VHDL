library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_7seg is
    Port ( bcd : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
	        digit : out STD_LOGIC_VECTOR (6 DOWNTO 1);
			  s7segment : out  STD_LOGIC_VECTOR (7 DOWNTO 0)
			  );
end bcd_7seg;

architecture Behavioral of bcd_7seg is

begin
		digit <=B"10_0000";
		process(bcd)
		begin
				if  (bcd="00000000") then s7segment <="00111111";
				elsif (bcd="00000001") then s7segment <="00000110"; 
				elsif (bcd="00000010") then s7segment <="01011011"; 
				elsif (bcd="00000011") then s7segment <="01001111"; 
				elsif (bcd="00000100") then s7segment <="01100110"; 
				elsif (bcd="00000101") then s7segment <="01101101"; 
				elsif (bcd="00000110") then s7segment <="01111101"; 
				elsif (bcd="00000111") then s7segment <="00000111"; 
				elsif (bcd="00001000") then s7segment <="01111111"; 
				elsif (bcd="00001001") then s7segment <="01100111";  
				elsif (bcd="00010000") then s7segment <="01110111"; --A
				elsif (bcd="00010001") then s7segment <="01111100"; --B
				elsif (bcd="00010010") then s7segment <="00111001"; --C
				elsif (bcd="00010011") then s7segment <="01011110"; --D
				elsif (bcd="00010100") then s7segment <="01111001"; --E
				elsif (bcd="00010101") then s7segment <="01110001"; --F
				else s7segment<="00000000";
				end if;
		end process;
end Behavioral;
