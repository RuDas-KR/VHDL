---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:51:34 02/06/2009 
-- Design Name: 
-- Module Name:    SL2-DM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SL2_DM is
port (		
					clk		: in std_logic;		
					RSTB 		: in std_logic;
					R_data	: out std_logic;
					G_data	: out std_logic;
					addr_out : out std_logic_vector(3 downto 0);
					enable	: out	std_logic;
					latch		: out std_logic;
					clk_out	: out std_logic;		
					red_en   : in std_logic; 
					green_en : in std_logic	);							
end SL2_DM;

architecture Behavioral of SL2_DM is

signal load 			 : std_logic;
signal clk_100k    : std_logic;
signal cnt				 : std_logic_vector(15 downto 0);
signal cnt_val		 : std_logic_vector(15 downto 0);

signal enable_gen  : std_logic;
signal latch_gen   : std_logic;
signal addr_gen		 : std_logic_vector(3 downto 0):="0000";

signal count		 	 : std_logic_vector(7 downto 0);

signal test 			 : std_logic;

signal dot_rdata		: std_logic;
signal dot_gdata		: std_logic;

begin

									     
process(CLK,rstb,load)
begin
	if RSTB = '0' then
		cnt <= (others => '0');
		clk_100k <= '0';
		elsif rising_edge (CLK) then
			if load = '1' then
				cnt <= (others => '0');
				clk_100k <= not clk_100k;
			else 
				cnt <= cnt + 1;
			end if;
		end if;
	end process;
	
	load <= '1' when (cnt = cnt_val) else '0';  

cnt_val <= X"00F9" when test = '0' else X"0001";	
--cnt_val <= X"01F3" when test = '0' else X"0001";	

test <= '0';

---control conunt      
process(clk_100k,rstb)
begin                  
	if RSTB = '0' then   
		count <= (others => '0');
		elsif rising_edge (clk_100k) then
			if count=X"44" then
				count <=(others =>'0');				
			else             
				count <= count + 1;				
			end if;
		end if;
end process;

-- enable generator
enable_gen <= '0' when ( count > X"00" and count < X"40" )else '1';

          
-- latch generator
process(clk_100k,rstb,count)
begin     
	if RSTB = '0' then
		latch_gen <='0';
		elsif rising_edge (clk_100k) then
			if count=X"3F" then
				latch_gen <= '0';					
			else 
				latch_gen <= '1';
		
			end if;
		end if;
end process;

-- addr generator
process(clk_100k,rstb,count)
begin         
	if RSTB = '0' then 
		addr_gen <= (others => '0');
		elsif rising_edge (clk_100k) then
			if count=X"43" then
				addr_gen <= addr_gen + 1;				
			else          
				addr_gen <= addr_gen ;
			end if;        
		end if;         
end process; 

enable 	<=  enable_gen;
latch  	<=  latch_gen;
addr_out <=  addr_gen;
clk_out  <=  clk_100k;



process(addr_gen)
begin
	case addr_gen is
		when "1111" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "0000" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "0001" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "0010" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "0011" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "0100" => R_data <= dot_rdata;
									 G_data <= dot_gdata;
		when "0101" => R_data <= dot_rdata;
								 	 G_data <= dot_gdata;
		when "0110" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "0111" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "1000" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "1001" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "1010" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "1011" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "1100" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "1101" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;
		when "1110" => R_data <= dot_rdata;
							 		 G_data <= dot_gdata;      
when others => R_data <= '0';		
					 		 G_data <= '0';    
		end case;
end process;

process(clk,rstb)
begin
	if RSTB = '0' then                  
		dot_rdata <= '0';         
		dot_gdata <= '0';         
		elsif rising_edge (clk) then 
			if red_en = '0' then
				dot_rdata <= '1';
			  dot_gdata <= '0';
		  elsif green_en = '0' then
				dot_rdata <= '0'; 
        dot_gdata <= '1'; 
      else
      	dot_rdata <= '1';
        dot_gdata <= '1';
      end if;
    end if;
end process;

end Behavioral;