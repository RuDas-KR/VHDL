----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:27 12/21/2009 
-- Design Name: 
-- Module Name:    test_led_dip_push - Behavioral 
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

entity test_led_dip_push is
    Port ( push   : in  STD_LOGIC_VECTOR (3 downto 0);
           dip_sw : in  STD_LOGIC_VECTOR (3 downto 0);
           led    : out  STD_LOGIC_VECTOR (3 downto 0));
end test_led_dip_push;

architecture Behavioral of test_led_dip_push is

begin

led(0) <= push or   dip_sw(0);
led(1) <= push and  dip_sw(1);
led(2) <= push xor  dip_sw(2);
led(3) <= push xnor dip_sw(3);

end Behavioral;

