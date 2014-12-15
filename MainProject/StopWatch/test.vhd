library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown is
port(			
	seg1	  : out std_logic_vector(6 downto 0):= "1100110";
   clk     : in   std_logic;
	Q : in std_logic;
	Q1 : in std_logic
	);
end updown;

architecture Behavioral of updown is
	signal	clk_cnt : integer range 0 to 100;
	signal	delay_enable : std_logic;
	signal   test_test : integer range 0 to 6 := 6; 
	signal seg_temp : integer range 0 to 7;

begin

process(Q, clk)

	begin
	
	if(Q = '0') then  -- push3
		if(test_test = 0) then
				seg1 <= "0111111";
		else
		if(clk'event and clk = '1') then -- Q_temp2가 1일 때 푸쉬3 누르는게 가능함.

			if clk_cnt = 100 then
				
				delay_enable <= '1';
				clk_cnt <= 0;

				test_test <= test_test - 1;						
			else
				delay_enable <= '0';
				clk_cnt <= clk_cnt + 1;
			end if;
		end if;
		end if;
	end if;
		if(test_test = 6) then		-- 카운트
			seg1 <= "1111101";
		elsif(test_test = 5) then
			seg1 <= "1101101";
		elsif(test_test = 4) then		-- 카운트
			seg1 <= "1100110";
		elsif(test_test = 3) then
			seg1 <= "1001111";
		elsif(test_test = 2)then
			seg1 <= "1011011";
		elsif(test_test = 1)then
			seg1 <= "0000110";
		elsif(test_test = 0) then
			seg1 <= "0111111";
	
		end if;	

	
	if(Q1 = '0') then -- 리셋
		test_test <= 6;
	end if;
	
	end process;


end Behavioral;

