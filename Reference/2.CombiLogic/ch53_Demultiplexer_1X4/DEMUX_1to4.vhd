----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:52 10/21/2009 
-- Design Name: 
-- Module Name:    DEMUX_1to4 - Behavioral 
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

entity DEMUX_1to4 is
 port ( 
 			D  : in std_logic;
			S  : in std_logic_vector (1 downto 0);
       	X0 : out std_logic;
       	X1 : out std_logic;
       	X2 : out std_logic;
       	X3 : out std_logic
       	);
end DEMUX_1to4;

architecture Behavioral of DEMUX_1to4 is

begin

process(S,D)
	begin
		case S is
			when "00"   => X0 <= D;   X1 <= '0'; X2 <= '0'; X3 <= '0';
			when "01"   => X0 <= '0'; X1 <= D;   X2 <= '0'; X3 <= '0';
			when "10"   => X0 <= '0'; X1 <= '0'; X2 <= D;   X3 <= '0';
			when "11"   => X0 <= '0'; X1 <= '0'; X2 <= '0'; X3 <= D;
			when others => X0 <= '0'; X1 <= '0'; X2 <= '0'; X3 <= '0';
  	end case;
 	end process;

end Behavioral;

