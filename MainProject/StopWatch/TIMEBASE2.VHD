library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TimeBase_Gen2 is
	generic ( 	main_clk 	: integer := 100000000;
					output_freq : positive := 1000 
	);
	port(	clk		:  in	std_logic ;
		reset		:  in	std_logic ;
		clk_out	:  out 	std_logic
	);
end TimeBase_Gen2 ;

architecture beh_timebase of  TimeBase_Gen2 is
	constant 	clk_hilow_cnt_value	: integer :=  ( (main_clk/ output_freq )/2 ) - 1;
begin
	----------------------------------------------------
	clock_gen : process( clk, reset )
		variable	 clk_cnt	: integer range  0 to clk_hilow_cnt_value ;
		variable  tmp_clk : std_logic;	
	begin
		if ( reset = '0' ) then
			clk_cnt := 0;
			tmp_clk := '0';
		elsif( clk'event and clk='1' ) then
			if( clk_cnt  = clk_hilow_cnt_value ) then
				clk_cnt := 0; 
				tmp_clk := not tmp_clk;
			else 
			clk_cnt := clk_cnt + 1;
			end if;
		end if;
		clk_out <= tmp_clk;

  	end process clock_gen;
	----------------------------------------------------
end beh_timebase;


