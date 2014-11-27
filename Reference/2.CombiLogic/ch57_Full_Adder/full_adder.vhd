----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:41:28 10/21/2009 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
	port (
				A  : in std_logic;
				B  : in std_logic;
				Cn : in std_logic;
				S  : out std_logic;
				C  : out std_logic
				);
end full_adder;

architecture Behavioral of full_adder is

component half_adder
	port ( 
	       A : in std_logic;
				 B : in std_logic;
				 S : out std_logic;
				 C : out std_logic
				);		
end component;

signal s_int   : std_logic;
signal c_int   : std_logic;
signal c_int_1 : std_logic;

begin

ha_0 : half_adder
	port map ( 
	       A => A,
				 B => B,
				 S => s_int,
				 C => c_int
				);		

ha_1 : half_adder
	port map ( 
	       A => s_int,
				 B => Cn,
				 S => S,
				 C => c_int_1
				);		

C <= c_int or c_int_1;

end Behavioral;

