--------------------------------------------------------------------
-- Debouncing Circuits Design 
library ieee;
use ieee.std_logic_1164.all;

entity debounce is
	port (	clk		: in std_logic;
		reset		: in std_logic;
		---------------------------------------------------------
		sw1_in	: in std_logic;
		----------------------------------------------------------
		sw1_out	: out std_logic	
		----------------------------------------------------------
	);
end debounce;

architecture design  of debounce is
	signal tmp_sw1		:  std_logic;
begin
	debounce_process: process( clk, reset, sw1_in,  tmp_sw1 )
	begin
		if( reset = '0' ) then 
		      -------------------------------------
		      -- Switch:Active Low, steady state:high
		      sw1_out 	<= '1';  
		      -------------------------------------
		      -- Switch:Active Low, steady state:high
		      tmp_sw1 	<= '1'; 
		      -------------------------------------
		elsif( clk'event and clk='0' ) then	-- falling edge
		      -------------------------------------
		      tmp_sw1 	<= sw1_in;
		      -------------------------------------
		      sw1_out 	<= tmp_sw1;
		      -------------------------------------
		end if;
	end process debounce_process;
	-------------------------------------------------------------
end design;
--------------------------------------------------------------------


