----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:13:01 02/26/2010 
-- Design Name: 
-- Module Name:    rop_test_top - Behavioral 
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

entity rom_test_top is
    Port ( clk_100m : in  STD_LOGIC;
           dip_sw : in  STD_LOGIC_VECTOR (3 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end rom_test_top;

architecture Behavioral of rom_test_top is

component ROM_16x8
	port (
	clka: IN std_logic;
	addra: IN std_logic_VECTOR(3 downto 0);
	douta: OUT std_logic_VECTOR(7 downto 0));
end component;

begin

rom1 : ROM_16x8
		port map (
			clka => clk_100m,
			addra => dip_sw,
			douta => LED);
			
end Behavioral;

