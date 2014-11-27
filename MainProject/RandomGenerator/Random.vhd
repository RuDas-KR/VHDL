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
    Port ( push : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           X : inout  STD_LOGIC_VECTOR (1 to 20);
           reset : in  STD_LOGIC; -- Reset Button
           count : inout  STD_LOGIC; -- 6 * 10^7 Hz  1Clk
           Y : inout  STD_LOGIC_VECTOR (0 to 2);
           LED2 : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end Random;

architecture Behavioral of Random is

	signal countin : integer range 0 to 5999999;
	signal cnt : std_logic_vector(14 downto 0);
	
begin
	process (clk, reset)
	begin
		if (reset = '0') then x <= "10101010101010101010";
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
		end if;
	end process;
	
	process (clk, push)
	begin
		if (reset = '0') then LED2 <= "00000000";
		
		elsif (count'event and count = '1' and (push = '0')) then
			if (Y = "000") then LED2 <= "00000001";
			elsif (Y = "001") then LED2 <= "00000001";
			elsif (Y = "010") then LED2 <= "00000011";
			elsif (Y = "011") then LED2 <= "00000111";
			elsif (Y = "100") then LED2 <= "00001111";
			elsif (Y = "101") then LED2 <= "00011111";
			elsif (Y = "110") then LED2 <= "00111111";
			elsif (Y = "111") then LED2 <= "01111111";
			end if;
		end if;
	end process;
end Behavioral;

