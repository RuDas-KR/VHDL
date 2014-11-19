library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity StopWatch_02 is
	port(	clk	:  in	std_logic ;
		reset		:  in	std_logic ;
		push1		:  in 	std_logic ;
		push2		:  in 	std_logic ;
		digit 	:  out 	std_logic_vector ( 1 to 6 ) ;
		seg		:  out 	std_logic_vector ( 6 downto 0 ) ; 
		led		:  out 	std_logic_vector ( 7 downto 0 ) 
	);
end StopWatch_02;

architecture  structural of StopWatch_02 is
	-------------------------------------------------------------------------------------------
	component   debounce is
		port (	clk		: in std_logic;
			reset		: in std_logic;
			sw1_in	: in std_logic;
			sw1_out	: out std_logic	
		);
	end  component  ;
	-------------------------------------------------------------------------------------------
	component TimeBase_Gen2 is
	generic ( 	main_clk 	: integer := 100000000;
					output_freq : positive := 1000 
	);
		port(	clk		:  in	std_logic ;
			reset		:  in	std_logic ;
			clk_out	:  out 	std_logic  
		);
	end component ;

	-------------------------------------------------------------------------------------------
	component int2seg2 is
	 	generic ( int_max_limit : positive := 60 );
		port (	reset	:  in std_logic ;
		    	int_value 	: in  integer range (int_max_limit-1 ) downto 0 ;
			seg_10 	:  out std_logic_vector ( 6 downto 0 )  ;
			seg_01	:  out std_logic_vector ( 6 downto 0 )  
		);
	end component ;
	-------------------------------------------------------------------------------------------
	component  Cnt_OneToSix is
		port(	clk	:  in	std_logic ;
			reset	:  in	std_logic ;
			value	:  out 	integer range 1 to 6  
		);
	end  component ;
	---------------------------------------------------------------------------------------------------	
	component counter is
		generic ( cnt_value : positive := 60 );
		port( 	reset 	: in   std_logic ;
			clk_in	: in   std_logic ;	  
			q 	: out  integer range ( cnt_value-1 ) downto 0 ;
			clk_out 	: out  std_logic 
		);
	end component ;
	---------------------------------------------------------------------------------------------------	
	signal  tmp_reset  			:  std_logic;
	signal  tmp_push1  			:  std_logic;
	signal  tmp_push2  			:  std_logic;
	signal  start_enable  			:  std_logic;
	signal  tmp_clk_1KHz,  tmp_clk_100Hz 	:  std_logic ;
	signal  tmp_clk_1sec,	  tmp_clk_1min 	:  std_logic ;
	signal  tmp_clk_100Hz_in 	:  std_logic ;
	signal  sel			:  integer range 1 to 6 ;
	signal  seg1, seg2, seg3  	:  std_logic_vector ( 6 downto 0 ) ; 
	signal  seg4, seg5, seg6  	:  std_logic_vector ( 6 downto 0 ) ; 
	signal  tmp_int_cent_sec  	: integer range 99 downto 0;
	signal  tmp_int_second    	: integer range 59 downto 0;
	signal  tmp_int_minute      	: integer range 59 downto 0;
begin
	-------------------------------------------------------------------
	led <= "00000000";
	-------------------------------------------------------------------
	u1_1kHz :  TimeBase_Gen2 
		port map(	clk => clk ,   	--  100MHz input
			reset=>reset , 			-- System Reset
			clk_out=> tmp_clk_1KHz  	-- 1KHz output for debounce, mux
		) ;
	u1_100Hz :  TimeBase_Gen2 
		generic map( 	main_clk => 100000000,
	 						output_freq => 100  
		)
		port map(	clk => clk ,   	--  100MHz input
			reset=>reset , 			-- System Reset
			clk_out=>tmp_clk_100Hz 	-- 100Hz ouput for stopwatch
		) ;

	u2 :  debounce port  map (  clk => tmp_clk_1KHz , 
			reset => reset ,  
			sw1_in => push1 ,
			sw1_out => tmp_push1 
		);
		
	u3 :   debounce port  map (  clk => tmp_clk_1KHz , 
			reset => reset ,  
			sw1_in => push2 ,
			sw1_out => tmp_push2 
		);
		
	u4_start_stop : process ( tmp_reset, tmp_push2 )
	begin
		if ( tmp_reset='0'  ) then start_enable <= '0';
		elsif ( tmp_push2'event and tmp_push2= '1' ) then  start_enable <= not start_enable;
		end if;
	end process u4_start_stop;

	tmp_reset <= tmp_push1 and reset;
			
	tmp_clk_100Hz_in <= start_enable and tmp_clk_100Hz ;
	
	-------------------------------------------------------------------
	cent_sec : counter 	generic map ( cnt_value => 100 )
			port map( 	reset 	=>	tmp_reset ,
					clk_in	=>	tmp_clk_100Hz_in, 
					q 	=>	tmp_int_cent_sec,
					clk_out 	=> 	tmp_clk_1sec 
				);
	cent_sec_output :  int2seg2  generic map ( int_max_limit  => 100 )
			port map(	reset 	=> 	reset, 
			    	int_value 	=> 	tmp_int_cent_sec,
					seg_10	=> 	seg5,
					seg_01	=>	seg6  
			);
	-------------------------------------------------------------------
	second : counter port map ( reset 	=>	tmp_reset  ,
					clk_in	=>	tmp_clk_1sec, 
				 	q 	=>	tmp_int_second,
				 	clk_out	=>	tmp_clk_1min 
		);
	second_output :  int2seg2  port map(	reset 	=> 	reset, 
			    		int_value 	=> 	tmp_int_second,
						seg_10	=> 	seg3,
						seg_01	=>	seg4  
			);
	---------------------------------------------------------------
	minute : counter port map (  reset 	=>	tmp_reset ,
						clk_in	=>	tmp_clk_1min, 
						q 	=>	tmp_int_minute,
						clk_out 	=>	open 
		);
	minute_output :  int2seg2  port map(	reset 	=> 	reset, 
			    		int_value 	=> 	tmp_int_minute,
						seg_10	=> 	seg1,
						seg_01	=>	seg2  
			);
	----------------------------------------------------------------
		
	u5 :  Cnt_OneToSix  port map (	clk => tmp_clk_1KHz,
				reset => reset ,
				value => sel   
	);

	------------------------------------------------------------------------------------------		
	mux_ctrl : process ( sel, seg1, seg2, seg3, seg4, seg5, seg6 )
	begin
	         if ( sel= 5 ) then 	digit<="001000";	seg<= seg5;
	         elsif ( sel= 6)	then	digit<="000100";	seg<= seg6;
	         end if;
	end process mux_ctrl;
	-------------------------------------------------------------------------------------------	
	
end structural;
------------------------------------------------------------------------------
