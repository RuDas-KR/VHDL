----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:46:37 10/21/2009 
-- Design Name: 
-- Module Name:    MUX_4to1 - Behavioral 
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

entity MUX_4to1 is
 port ( 
 			D0 : in std_logic;
       	D1 : in std_logic;
			D2 : in std_logic;
			D3 : in std_logic;
       	S : in std_logic_vector (1 downto 0);
       	X : out std_logic
     	);
end MUX_4to1;

architecture Behavioral of MUX_4to1 is

begin

X <= D0 when S = "00" else
     D1 when S = "01" else
     D2 when S = "10" else
     D3;

end Behavioral;

