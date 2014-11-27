------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Cnt_OneToSix is
	port(	clk	:  in	std_logic ;
		reset	:  in	std_logic ;
		value	:  out 	integer range  1 to 6 
	);
end Cnt_OneToSix ;

architecture  beh of Cnt_OneToSix  is
	signal   tmp_value : integer range 1 to 6; 
begin
	process ( clk, reset, tmp_value )
	begin
		if( reset = '0' ) then tmp_value <= 1;
		elsif ( clk'event  and clk='1' ) then
			if( tmp_value = 6 ) then 
				tmp_value <= 1 ;
			else 
				tmp_value <= tmp_value + 1 ;
			end if;
		end if;	
		-- value <=  tmp_value;
	end process;
	value <= tmp_value;
end beh;
------------------------------------------------------------------------------

