library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Random_fail is
    Port ( 
		     LED : out  STD_LOGIC_VECTOR (7 downto 0);	 
           clk : in  STD_LOGIC;
           reset3 : in  STD_LOGIC; -- Reset Button
			  tq_counter_temp2 : in integer;			  
			  SEG_LINK : in STD_LOGIC_VECTOR (6 downto 0)
			 );
end Random_fail;

architecture Behavioral of Random_fail is

	signal X : STD_LOGIC_VECTOR (1 to 20);
	signal Y : STD_LOGIC_VECTOR (0 to 3);
	signal countin : integer range 0 to 5999999;
	signal cnt : std_logic_vector(14 downto 0);
	signal count : STD_LOGIC; -- 6 * 10^7 Hz  1Clk

	
begin
	process (clk)
	begin
		if (clk'event and clk = '1') then 
				 x <= "10101010101010101010";

		cnt <= cnt + 1;
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
	
	process (clk, reset3)
	begin
		
		if (reset3 = '0') then LED <= "00000000";
		
		elsif (count'event and count = '1') then
		if (SEG_LINK = "0111111" or tq_counter_temp2 = 0) then
			if (Y = "0000") then LED <= "00001001";
				elsif (Y = "0001") then LED <= "00110000";
				elsif (Y = "0010") then LED <= "01101010";
				elsif (Y = "0011") then LED <= "00111001";
				elsif (Y = "0100") then LED <= "11100110";
				elsif (Y = "0101") then LED <= "11000011";
				elsif (Y = "0110") then LED <= "10101100";
				elsif (Y = "0111") then LED <= "01011010";
				elsif (Y = "1000") then LED <= "10100110";
				elsif (Y = "1001") then LED <= "01000111";
				elsif (Y = "1010") then LED <= "11110011";
				elsif (Y = "1011") then LED <= "11010101";
				elsif (Y = "1100") then LED <= "00100110";
				elsif (Y = "1101") then LED <= "10010101";
				elsif (Y = "1110") then LED <= "10101101";
				elsif (Y = "1111") then LED <= "01111010";
				end if;
			end if;
		end if;
	end process;

end Behavioral;	