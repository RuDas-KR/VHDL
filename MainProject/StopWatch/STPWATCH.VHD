library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity StopWatch_02 is
	port(	
		FPGA_CLK : in  STD_LOGIC;
      FPGA_RST : in  STD_LOGIC;
		clk	:  in	std_logic ;
		reset		:  in	std_logic ;
		push1		:  in 	std_logic;
		push2		:	in		std_logic;
		push3		:	in		std_logic;
		push4		:	in		std_logic;		
		digit 	:  out 	std_logic_vector ( 1 to 6 ) ;
		seg		:  out 	std_logic_vector ( 6 downto 0 ) ; 
      count : out  STD_LOGIC_VECTOR (7 downto 0);		
      LED2 : inout  STD_LOGIC_VECTOR (7 downto 0);
		DIP  : in  STD_LOGIC_VECTOR (7 downto 0));
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
			clk_out 	: out  std_logic;
			tq_counter : inout integer
		);
	end component ;
	---------------------------------------------------------------------------------------------------	
	component updown is
		port (  
			Q			:	in std_logic;
			Q1			:	in std_logic;
			seg1	  : out std_logic_vector(6 downto 0);
			clk		:	in std_logic	
		);
	end component;
	---------------------------------------------------------------------------------------------------	
	component Random is
		port (  
			LED : inout  STD_LOGIC_VECTOR (7 downto 0);		
			Q : in  STD_LOGIC;			
			push : in  STD_LOGIC;		
			clk : in  STD_LOGIC;
			reset2 : in  STD_LOGIC; -- Reset Button
			DIP  : in  STD_LOGIC_VECTOR (7 downto 0);
			seg1  : out  STD_LOGIC_VECTOR (6 downto 0);
			seg_result8 : out integer;
			seg2 : in STD_LOGIC_VECTOR (6 downto 0)
		);
	end component;
	---------------------------------------------------------------------------------------------------	 
	component random_fail is
		port (	reset3	:  in std_logic ;
					clk : in  STD_LOGIC;
					SEG_LINK	: in  STD_LOGIC_VECTOR (6 downto 0);
					tq_counter_temp2 : in integer;					
					LED : inout  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component ;	
	---------------------------------------------------------------------------------------------------	
	component BUFGP
	port ( i : in std_logic;
			 o : out std_logic
			 );
	end component;
	---------------------------------------------------------------------------------------------------	
	signal  tmp_reset  			:  std_logic;
	signal  tmp_push1  			:  std_logic;
	signal  tmp_push3  			:  std_logic;
	signal  start_enable  			:  std_logic;
	signal  tmp_clk_1KHz,  tmp_clk_100Hz :  std_logic ;
	signal  tmp_clk_1sec,	  tmp_clk_1min 	:  std_logic ;
	signal  tmp_clk_100Hz_in 	:  std_logic ;
	signal  tmp_clk_100Hz_in2 	:  std_logic ;	
	signal  sel			:  integer range 1 to 6 ;
	signal  seg_temp		:	std_logic_vector (6 downto 0);
	signal seg_temp2		:	std_logic_vector (6 downto 0);
	signal seg_1_temp		:	std_logic_vector (6 downto 0);
	signal  seg1, seg2, seg3  	:  std_logic_vector ( 6 downto 0 ) ; 
	signal  seg4, seg5, seg6  	:  std_logic_vector ( 6 downto 0 ) ; 
	signal  tmp_int_cent_sec  	: integer range 99 downto 0;
	signal  tmp_int_second    	: integer range 59 downto 0;
	signal  tmp_int_minute      	: integer range 59 downto 0;
	signal Q_tmp :	std_logic;
	signal tq_counter_temp : integer;
	signal seg_result8_temp : integer;
	signal FPGA_CLK_TMP 	: std_logic;
	signal CLK_2HZ			: std_logic;
	signal CLK_1KHZ		: std_logic;
	signal FPGA_RST_TMP	: std_logic;

begin
	-------------------------------------------------------------------
u10 : BUFGP
	port map ( i => FPGA_CLK,
				  o => FPGA_CLK_TMP
				  );
				  
FPGA_RST_TMP <= not FPGA_RST;
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
		
	u4 :   debounce port  map (  clk => tmp_clk_1KHz , 
			reset => reset ,  
			sw1_in => push3 ,
			sw1_out => tmp_push3 
		);		
		

		
	u4_start_stop : process ( tmp_reset, tmp_push3 )
	begin
		if ( tmp_reset='0'  ) then start_enable <= '0';
		elsif ( tmp_push3= '0' ) then  start_enable <= '1';
		end if;
	end process u4_start_stop;

	tmp_reset <= tmp_push1;
	Q_tmp <= tmp_push3;	

	tmp_clk_100Hz_in <= start_enable and tmp_clk_100Hz ;
	-------------------------------------------------------------------
	cent_sec : counter 	generic map ( cnt_value => 100 )
			port map( 	reset 	=>	tmp_reset ,
					clk_in	=>	tmp_clk_100Hz_in, 
					q 	=>	tmp_int_cent_sec,
					clk_out 	=> 	tmp_clk_1sec,
					tq_counter =>	tq_counter_temp

				);
	cent_sec_output :  int2seg2  generic map ( int_max_limit  => 100 )
			port map(	reset 	=> 	reset, 
			    	int_value 	=> 	tmp_int_cent_sec,
					seg_10	=> 	seg5,
					seg_01	=>	seg6  
			);
	-------------------------------------------------------------------
		
	u5 :  Cnt_OneToSix  port map (	clk => tmp_clk_1KHz,
				reset => reset ,
				value => sel   
	);

	------------------------------------------------------------------------------------------		

	u6 :  updown
		port map (  
			seg1 => seg_temp,
			Q => Q_tmp,
			Q1 => tmp_reset,
			clk => tmp_clk_1KHz
		);
		
	------------------------------------------------------------------------------------------		
	u7 :  Random
		port map ( 
			Q	  => tmp_push3,
			push => Q_tmp,
			reset2 => tmp_reset,
			seg1	=>	seg_temp2,
			clk => clk,
			DIP => DIP,
			LED => LED2,			
			seg_result8 => seg_result8_temp,
			seg2 => seg_temp
		);

	------------------------------------------------------------------------------------------		
	u8 :  Random_fail
		port map (  
			reset3 => tmp_reset,
			clk => clk,
			LED => LED2,
			SEG_LINK => seg_temp, --
			tq_counter_temp2 => tq_counter_temp -- 
		);

	------------------------------------------------------------------------------------------				
	mux_ctrl : process ( sel, seg5, seg6 )
	begin
		if(seg_temp2 = "1111111" and seg_temp = "0111111") then
			if ( sel= 5 ) then 	digit<="100000";	seg<= "1110001"; -- F
			elsif ( sel= 6)	then	digit<="010000";	seg<= "0110000"; -- I
			elsif ( sel = 1)	then  digit<="001000"; seg<= "0110111";  -- N
			elsif ( sel = 2) then	digit<="000100"; seg<= "0110000";  -- I		
			elsif ( sel = 3)	then  digit<="000010"; seg<= "1101101";  -- S
			elsif ( sel = 4) then	digit<="000001"; seg<= "1110110";  -- H			
			end if;	
		elsif(seg_temp = "0111111" or tq_counter_temp = 0) then -- tq_counter_temp : 시간 카운터
			if ( sel= 5 ) then 	digit<="001000";	seg<= "0111000"; -- L
			elsif ( sel= 6)	then	digit<="000100";	seg<= "0111111"; -- O
			elsif ( sel = 1)	then  digit<="000010"; seg<= "1101101";  -- S
			elsif ( sel = 2) then	digit<="000001"; seg<= "1111001";  -- E
			end if;
		else
			if ( sel= 5 ) then 	digit<="001000";	seg<= seg5;
			elsif ( sel= 6)	then	digit<="000100";	seg<= seg6;
			elsif ( sel = 1)	then  digit<="010000"; seg<= seg_temp;  -- updown
			elsif ( sel = 2) then	digit<="000001"; seg<= seg_temp2;  -- random
			end if;
		end if;
	end process mux_ctrl;
	-------------------------------------------------------------------------------------------	
	
end structural;
------------------------------------------------------------------------------
