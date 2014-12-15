library ieee;
use ieee.std_logic_1164.all;

entity counter is
	generic ( cnt_value : positive := 60 );
	port( 	reset 	: in   std_logic ;
		clk_in	: in   std_logic ;	  
		q 	: out  integer range (cnt_value-1) downto 0 ;
		clk_out : out  std_logic;
		tq_counter : inout integer	
	);
end counter;

architecture design of counter is
	signal tq 	: integer range (cnt_value-1) downto 0 ;
	signal 	tclk	: std_logic ;
	signal Q_temp2 : integer := 0;	
	signal	clk_cnt : integer range 0 to 100;
begin
	process( reset, clk_in, tq )
		--variable  tq 	: integer range (cnt_value-1) downto 0 ;
	begin
		if ( reset = '0' ) then  
			Q_temp2 <= 1;
			tq<= 30; 
			tclk<='0'; 
			tq_counter <= 1;			
		elsif ( clk_in'event and clk_in='1' and tq_counter = 1 and Q_temp2 = 1) then
			clk_cnt <= clk_cnt + 1;						
			if( tq = (cnt_value-1) )  then  
				tq <= 30 ;
				tclk <=  '1';
			else
				if(clk_cnt = 100) then
					tq <=tq-1;
					tclk  <= '0';
				end if;	
			end if;
			if(tq = 1) then -- 시간 카운터 조건
				tq_counter <= 0;
			end if;
		end if;
	end process;
	q<=tq;
	clk_out <= tclk;
end design;

