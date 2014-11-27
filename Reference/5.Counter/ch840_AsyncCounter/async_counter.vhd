----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:04 02/26/2010 
-- Design Name: 
-- Module Name:    async_counter - Behavioral 
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

entity async_counter is
    Port ( clk_in   : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           bcd_100k : out  STD_LOGIC_VECTOR (3 downto 0);
           bcd_10k  : out  STD_LOGIC_VECTOR (3 downto 0);
           bcd_1k   : out  STD_LOGIC_VECTOR (3 downto 0);
           clk_100k : out  STD_LOGIC;
           clk_10k  : out  STD_LOGIC;
           clk_1k   : out  STD_LOGIC);
end async_counter;

architecture Behavioral of async_counter is
signal tmp_clk_100k, tmp_clk_10k, tmp_clk_1k : std_logic;

component cnt_10
    Port ( clk_in  : in  STD_LOGIC;
           rst     : in  STD_LOGIC;
           q       : out  STD_LOGIC_VECTOR (3 downto 0);
           clk_out : out  STD_LOGIC);
end component;

begin

output_100k : cnt_10 port map
	( clk_in  => clk_in,
	  rst     => reset,
	  q       => bcd_100k,
	  clk_out => tmp_clk_100k);

output_10k : cnt_10 port map
	( clk_in  => tmp_clk_100k,
	  rst     => reset,
	  q       => bcd_10k,
	  clk_out => tmp_clk_10k);

output_1k : cnt_10 port map
	( clk_in  => tmp_clk_10k,
	  rst     => reset,
	  q       => bcd_1k,
	  clk_out => tmp_clk_1k);
	  
	  
end Behavioral;

