---------------------------------------------------------------------
--          integer to 7 segment converter 
--          > 입력 값 : 0∼99
--          > 십의 자리와 일의 자리 분리
--          > 각각의 자리값에 대한 7 segment로의 변환
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity int2seg2 is
 	generic ( int_max_limit : positive := 60 );
	port (	reset	:  in std_logic ;
	    	int_value : in  integer range (int_max_limit-1 ) downto 0 ;
		seg_10 	:  out std_logic_vector ( 6 downto 0 )  ;
		seg_01	:  out std_logic_vector ( 6 downto 0 )  
	);
end int2seg2;


architecture design of int2seg2 is
	-------------------------------------------------------------------------------------------
	component int2seg1 is
		port (	int     : in  integer range 15 downto 0 ;
			seg  : out std_logic_vector ( 6 downto 0 ) 
		);
	end component ;
	-------------------------------------------------------------------------------------------
 	signal  dec_10	:  integer range 9 downto 0;
 	signal  dec_01	:  integer range 9 downto 0;
begin
	separate_int : process( reset, int_value )
	begin
	    	if( reset='0' )  then  	dec_10 <= 0;  
					dec_01 <= 0;
--	    	elsif (  int_value  >= 90 )  then	dec_10 <= 9;
--						dec_01 <= int_value - 90;
--		elsif (  int_value  >= 80 )  then	dec_10 <= 8;
--		 				dec_01 <= int_value - 80;
--		elsif (  int_value  >= 70 )  then	dec_10 <= 7;
--		 					dec_01 <= int_value - 70;
--		elsif (  int_value  >= 60 )  then	dec_10 <= 6;
--							dec_01 <= int_value - 60;
		elsif (  int_value  >= 50 )  then	dec_10 <= 5;
							dec_01 <= int_value - 50;
		elsif (  int_value  >= 40 )  then	dec_10 <= 4;
							dec_01 <= int_value - 40;
		elsif (  int_value  >= 30 )  then	dec_10 <= 3;
	 						dec_01 <= int_value - 30;
		elsif (  int_value  >= 20 )  then	dec_10 <= 2;
			 				dec_01 <= int_value - 20;
		elsif (  int_value  >= 10 )  then	dec_10 <= 1;
			 				dec_01 <= int_value - 10;
		else  	dec_10 	<= 0;
			dec_01 	<=  int_value  ;
		end if;
	
	end process separate_int;
	---------------------------------------------------------------
	seg_10_ten : int2seg1 port map (	 int => dec_10,
				 seg => seg_10
		);
	---------------------------------------------------------------
	seg_01_one : int2seg1 port map ( int => dec_01,
				   seg => seg_01
		);
	---------------------------------------------------------------
end design;
---------------------------------------------------------------------



