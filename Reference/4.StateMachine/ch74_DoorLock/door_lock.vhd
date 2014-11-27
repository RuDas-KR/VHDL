library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity door_lock is
    Port ( CLK       : in  STD_LOGIC;
					RST       : in  STD_LOGIC;
					ps_start   : in  STD_LOGIC;
ps_end    : in  STD_LOGIC;
ps_num    : in  STD_LOGIC_VECTOR (3 downto 0);
            door_Open : out  STD_LOGIC;
            state_out    : out  STD_LOGIC_VECTOR (4 downto 0)
            );
end door_lock;

architecture Behavioral of door_lock is
	type states is (ready, in_start, in_end, door_con, end_state);
	signal state 		: states;
	signal password  : std_logic_vector(3 downto 0):="1001"; -- 기억된 비밀번호
	signal ps_in      : std_logic_vector(3 downto 0); -- 입력된 비밀번호
	signal ps_true 	: std_logic;
	signal open_sig  : std_logic;
	signal lock_sig  : std_logic;
	signal lock_cnt  : std_logic_vector(3 downto 0);
	signal cnt_1hz : std_logic_vector(27 downto 0);
	signal clk_1hz : std_logic;
begin

process(RST, CLK)
begin
if RST = '0' then
state <= ready;
elsif rising_edge(CLK) then
	case state is
		when ready =>
			if ps_start = '0' then
			state <= in_start;
			else
			state <= ready;
			end if;
		when in_start =>
			if ps_end = '0' then
			state <= in_end;
			else
			state <= in_start;
			end if;
		when in_end =>
			state <= door_con;
		when door_con =>
			if ps_true = '1' then
			state <= end_state;
			else
state <= ready;
			end if;
		when end_state =>
			if lock_sig = '1' then
			state <= ready;
			else
			state <= end_state;
			end if;
	end case;
end if;
end process;

	process(state)
	begin
		case state is 
				when ready 		=> state_out <= "00001";
				when in_start => state_out <= "00010";
				when in_end 	=> state_out <= "00100";
				when door_con => state_out <= "01000";
				when end_state=> state_out <= "10000";
		end case;
	end process;
	
process(RST, CLK)
begin
if (RST = '0') or (state = ready) then
ps_in <= "0000";
elsif rising_edge(CLK) then
	if (state = in_start) and (ps_end = '0') then
		ps_in <= ps_num;
		else
		ps_in <= ps_in;
	end if;
end if;
end process;

process(CLK, RST)
begin
if (RST = '0') or (state = ready) then
	ps_true <= '0';
elsif rising_edge(CLK) then
	if state = in_end then
if ps_in = password then
		ps_true <= '1' ;
		else
		ps_true <= '0' ;
end if;
	end if;
end if;
end process;
process(CLK, RST)                  
begin                         
if (RST = '0') or (state = ready) then             
open_sig <= '0';          
elsif rising_edge(CLK) then
	if state = end_state then
		if (ps_true = '1') and (lock_sig = '0') then
			open_sig <= '1';
		elsif (ps_true = '1') and (lock_sig = '1') then
			open_sig <= '0';
		end if;
	end if;
end if;
end process;
	
process(clk_1hz, RST)
begin
if (RST = '0') or (state = ready) then
	lock_cnt <= (others => '0');
	lock_sig <= '0';
elsif rising_edge(clk_1hz) then
	if state = end_state then
		if lock_cnt = X"3" then
			lock_sig <= '1'; 
			lock_cnt <= lock_cnt;
		else
			lock_sig <= '0';
			lock_cnt <= lock_cnt + 1;
		end if;
	end if;
end if;
end process;

	door_open <= open_sig;	

process(clk, rst)
begin
	if rst = '0' then
	cnt_1hz <= (others =>'0');
	clk_1hz <= '0';
	elsif rising_edge(clk) then
	       if cnt_1hz = X"5F5E0FF" then
		--if cnt_1hz = X"0000001" then
			cnt_1hz <= (others => '0');
			clk_1hz <= '1';
		else
			cnt_1hz <= cnt_1hz + 1;
		        clk_1hz <= '0';
		end if;
	end if;
end process;

end Behavioral;
