----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:56:16 10/21/2009 
-- Design Name: 
-- Module Name:    Encoder_8to3 - Behavioral 
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

entity Encoder_8to3 is
 port ( 
 				D : in std_logic_vector (7 downto 0);
				X : out std_logic;
       	Y : out std_logic;
				Z : out std_logic
				);
end Encoder_8to3;

architecture Behavioral of Encoder_8to3 is

begin

	process(D)
	begin
		case D is
			when "00000001" => X <= '0'; Y <= '0'; Z <= '0';
			when "00000010" => X <= '0'; Y <= '0'; Z <= '1';
			when "00000100" => X <= '0'; Y <= '1'; Z <= '0';
			when "00001000" => X <= '0'; Y <= '1'; Z <= '1';
			when "00010000" => X <= '1'; Y <= '0'; Z <= '0';
			when "00100000" => X <= '1'; Y <= '0'; Z <= '1';
			when "01000000" => X <= '1'; Y <= '1'; Z <= '0';
			when "10000000" => X <= '1'; Y <= '1'; Z <= '1';
			when others => X <= '0'; Y <= '0'; Z <= '0';
		end case;
	end process;

end Behavioral;

