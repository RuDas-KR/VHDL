library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity moore_ex is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           X 	 : in  STD_LOGIC;
           Q 	 : out  STD_LOGIC_VECTOR (2 downto 0));
end moore_ex;

architecture Behavioral of moore_ex is

	type states is (s0, s1, s2, s3);
	signal state : states;

begin

	process(CLK, RST)
	begin
		if RST = '0' then
				state <= s0;
		elsif rising_edge(CLK) then
			case state is
					when s0 => 
									if x='1' then
										state <= s1;
									else
										state <= s0;
									end if;
					when s1 => 
									if x='1' then
										state <= s2;
									else
										state <= s1;
									end if;
					when s2 => 
									if x='1' then
										state <= s3;
									else
										state <= s2;
									end if;
					when s3 => 
									if x='1' then
										state <= s0;
									else
										state <= s3;
									end if;
			end case;
		end if;
	end process;
	
	process(state)
	begin
		case state is 
				when s0 => Q <= "000";
				when s1 => Q <= "001";
				when s2 => Q <= "010";
				when s3 => Q <= "100";
		end case;
	end process;

end Behavioral;

