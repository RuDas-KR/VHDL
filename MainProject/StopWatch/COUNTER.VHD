library ieee;
use ieee.std_logic_1164.all;

entity counter is
	generic ( cnt_value : positive := 60 );
	port( 	reset 	: in   std_logic ;
		clk_in	: in   std_logic ;	  
		q 	: out  integer range (cnt_value-1) downto 0 ;
		clk_out : out  std_logic 
	);
end counter;

architecture design of counter is
	signal tq 	: integer range (cnt_value-1) downto 0 ;
	signal 	tclk	: std_logic ;
begin
	process( reset, clk_in, tq )
		--variable  tq 	: integer range (cnt_value-1) downto 0 ;
	begin
		if ( reset = '0' ) then  
			tq<= 60; 
			tclk<='0'; 
		elsif ( clk_in'event and clk_in='1' ) then
			if( tq = (cnt_value-1) )  then  
				tq <= 60 ;
				tclk <=  '1';
			else
				tq <=tq-1;
				tclk  <= '0';
			end if;
		end if;
	end process;
	q<=tq;
	clk_out <= tclk;
end design;

