----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:46 03/04/2010 
-- Design Name: 
-- Module Name:    spram_test_top - Behavioral 
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

entity spram_test_top is
    Port ( clk100m : in  STD_LOGIC;
           push_sw : in  STD_LOGIC; 
           dip_sw  : in  STD_LOGIC_VECTOR (7 downto 0);
           led     : out  STD_LOGIC_VECTOR (3 downto 0));
end spram_test_top;

architecture Behavioral of spram_test_top is

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component SPRAM_16x4
	port (
	clka  : IN std_logic;
	wea   : IN std_logic_VECTOR(0 downto 0);
	addra : IN std_logic_VECTOR(3 downto 0);
	dina  : IN std_logic_VECTOR(3 downto 0);
	douta : OUT std_logic_VECTOR(3 downto 0));
end component;

-- Synplicity black box declaration
--attribute syn_black_box : boolean;
--attribute syn_black_box of SPRAM_16x4: component is true;

signal spram_wea  : std_logic;
signal spram_addr : std_logic_VECTOR(3 downto 0);
signal spram_dina : std_logic_VECTOR(3 downto 0);

begin

spram_wea   <= not push_sw;
spram_addr  <= not dip_sw(3 downto 0);
spram_dina  <= not dip_sw(7 downto 4);

spram1 : SPRAM_16x4
		port map (
			clka  => clk100m,
			wea(0)   => spram_wea,
			addra => spram_addr,
			dina  => spram_dina,
			douta => led);

end Behavioral;

