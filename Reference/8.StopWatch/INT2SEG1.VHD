---------------------------------------------------------------------
--          1자리 integer to 7 segment converter
--          >  입력 값 :  0∼9
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity int2seg1 is
	port (	int     : in  integer range 9 downto 0 ;
		seg  : out std_logic_vector ( 6 downto 0 ) 
	);
end int2seg1;

architecture behavior of int2seg1 is
begin
	process( int )
	begin
		if ( int=0 )   then	seg<= "0111111";	-- gfedcba
		elsif ( int=1 )  then 	seg<="0000110";	-- gfedcba 
		elsif ( int=2 )  then 	seg<="1011011";	-- gfedcba 
		elsif ( int=3 )  then 	seg<="1001111";	-- gfedcba 
		elsif ( int=4 )  then 	seg<="1100110";	-- gfedcba 
		elsif ( int=5 )  then 	seg<="1101101";	-- gfedcba 
		elsif ( int=6 )  then 	seg<="1111101";	-- gfedcba 
		elsif ( int=7 )  then 	seg<="0000111";	-- gfedcba 
		elsif ( int=8 )  then 	seg<="1111111";	-- gfedcba 
		else 	seg<="1100111";	-- gfedcba  ( int=9 )
		end if;
	end process;
end behavior;



