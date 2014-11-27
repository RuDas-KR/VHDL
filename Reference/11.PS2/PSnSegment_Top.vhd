----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:30:42 10/22/2009 
-- Design Name: 
-- Module Name:    PS2nSegment_Top - Behavioral 
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

entity PS2nSegment_Top is
	port (
				FPGA_RSTB  : in std_logic;	-- Input Reset (Active Low)
				FPGA_GCLK1 : in std_logic;	-- FPGA GCLK1 (100Mhz)

				KEY_CLK    : in std_logic;	-- PS/2 CLK
				KEY_DATA   : in std_logic;	-- PS/2 Data

	      DIGIT      : OUT std_logic_vector (6 downto 1);	-- 7-Segment Digit
	      SEG_A      : OUT std_logic;
	      SEG_B      : OUT std_logic;
	      SEG_C      : OUT std_logic;
	      SEG_D      : OUT std_logic;
	      SEG_E      : OUT std_logic;
	      SEG_F      : OUT std_logic;
	      SEG_G      : OUT std_logic;
	      SEG_DP     : OUT std_logic;

				LED        : out std_logic_vector (7 downto 0)	-- Discrete LED [7..0]				
				);				
end PS2nSegment_Top;

architecture Behavioral of PS2nSegment_Top is

component ps2_key
	port (
				RSTB       : in std_logic;	-- Input Reset (Active Low)
				CLK        : in std_logic;	-- FPGA GCLK1 (100Mhz)
				KEY_CLK    : in std_logic;	-- PS/2 CLK
				KEY_DATA   : in std_logic;	-- PS/2 Data
				ASCII_DATA : out std_logic_vector (7 downto 0)	-- ASCII Code
				);				
end component;

component Seg_Dis
	port (
				DIN   : in std_logic_vector (7 downto 0);	-- ASCII Data
				DIGIT : out std_logic_vector (6 downto 1);
				SEG   : out std_logic_vector (7 downto 0)
				);
end component;

signal ascii_data : std_logic_vector (7 downto 0);
signal seg        : std_logic_vector (7 downto 0);

begin

u_ps2_key : ps2_key
	port map (
				RSTB       => FPGA_RSTB  ,
				CLK        => FPGA_GCLK1 ,
				KEY_CLK    => KEY_CLK    ,
				KEY_DATA   => KEY_DATA   ,
				ASCII_DATA => ascii_data 
				);				

u_Seg_Dis : Seg_Dis
	port map (
				DIN   => ascii_data ,
				DIGIT => DIGIT      ,
				SEG   => seg
				);

SEG_A  <= seg(7);
SEG_B  <= seg(6);
SEG_C  <= seg(5);
SEG_D  <= seg(4);
SEG_E  <= seg(3);
SEG_F  <= seg(2);
SEG_G  <= seg(1);
SEG_DP <= seg(0);

LED <= ascii_data;

end Behavioral;

