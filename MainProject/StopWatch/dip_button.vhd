----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:12 11/27/2014 
-- Design Name: 
-- Module Name:    Random - Behavioral 
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

entity Random is
    Port ( 
			  Q	 : in	STD_LOGIC; --(second)
			  push : in  STD_LOGIC; --(third)
           clk : in  STD_LOGIC;
           reset2 : in  STD_LOGIC; -- Reset Button (first)    
           LED : inout  STD_LOGIC_VECTOR (7 downto 0);
			  DIP  : in  STD_LOGIC_VECTOR (7 downto 0);
			  seg1  : out STD_LOGIC_VECTOR (6 downto 0);
			  seg_result8 : out integer;
			  seg2 : in STD_LOGIC_VECTOR (6 downto 0)
			  );
end Random;

architecture Behavioral of Random is

	signal test : std_logic;
	signal countin : integer range 0 to 5999999;
	signal cnt : std_logic_vector(14 downto 0);
   signal X : STD_LOGIC_VECTOR (1 to 20);
	signal Y : STD_LOGIC_VECTOR (0 to 3);
	signal LED_TEMP : STD_LOGIC_VECTOR (7 downto 0);
	signal Q_temp2 : integer := 0;
	signal Q_temp3 : integer := 0; -- 게임 시작	
	signal seg1_temp : std_logic_vector (6 downto 0);
	signal count : STD_LOGIC; -- 6 * 10^7 Hz  1Clk	
begin
	

	process (clk, reset2)

	begin

		if (reset2 = '1') then x <= "10101010101010101010";
									 countin <= 0;
									 count <= '0';
									 cnt <= "000000000000000";
							 

									 
		elsif (clk'event and clk = '1') then cnt <= cnt + 1;
														 X <= X + 1;
			
			if (countin = 5999999) then countin <= 0;
												 count <= not count;
			else countin <= countin + 1;
			end if;
				
			Y(0) <= X(2) xor X(7) xor X(14) xor X(15) xor X(19);
			Y(1) <= X(6) xor X(8) xor X(11) xor X(13) xor X(18);
			Y(2) <= X(1) xor X(3) xor X(5) xor X(20) xor X(17);
			Y(3) <= X(4) xor X(9) xor X(10) xor X(16) xor X(12);
		end if;
		

	end process;
	
	process (clk)
		variable count_sum: integer;
		variable count1: integer;
		variable count2: integer;	
	begin
	--		Digit <= '1';
		count1 := 0;
		count2 := 0;

	if (count'event and count = '1' and reset2 = '0' ) then

			if (Y = "0000") then LED_TEMP <= "00001001";
			elsif (Y = "0001") then	LED_TEMP <= "00110000";
			elsif (Y = "0010") then LED_TEMP <= "01101010";
			elsif (Y = "0011") then LED_TEMP <= "00111001";
			elsif (Y = "0100") then LED_TEMP <= "11100110";
			elsif (Y = "0101") then LED_TEMP <= "11000011";
			elsif (Y = "0110") then LED_TEMP <= "10101100";
			elsif (Y = "0111") then LED_TEMP <= "01011010";
			elsif (Y = "1000") then LED_TEMP <= "10100110";
			elsif (Y = "1001") then LED_TEMP <= "01000111";
			elsif (Y = "1010") then LED_TEMP <= "11110011";
			elsif (Y = "1011") then LED_TEMP <= "11010101";
			elsif (Y = "1100") then LED_TEMP <= "00100110";
			elsif (Y = "1101") then LED_TEMP <= "10010101";
			elsif (Y = "1110") then LED_TEMP <= "10101101";
			elsif (Y = "1111") then LED_TEMP <= "01111010";
			end if;				
		end if;
		if	(reset2 = '0') then
				seg1 <= "0000000";
		end if;

	if(push = '0') then

		FOR j IN 0 TO 7 LOOP   
			IF(DIP(j)='1' and LED_TEMP(j)='1') THEN   count1 :=count1+1;
			END IF;
			
			IF(DIP(j)='0' and LED_TEMP(j)='0') THEN   count2 :=count2+1;
			end if;
		END LOOP;
		
		if(count1+count2=0)then seg1<="0000000"; 
		elsif(count1+count2=1)then seg1<="0000110"; 
		elsif(count1+count2=2)then seg1<="1011011"; 
		elsif(count1+count2=3)then seg1<="1001111"; 
		elsif(count1+count2=4)then seg1<="1100110";
		elsif(count1+count2=5)then seg1<="1101101"; 
		elsif(count1+count2=6)then seg1<="1111100"; 
		elsif(count1+count2=7)then seg1<="0100111";
		elsif(count1+count2=8)then seg1<="1111111";
		end if;
	END IF;
end process;

end Behavioral;