
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_binarytobcd IS
END tb_binarytobcd;
 
ARCHITECTURE behavior OF tb_binarytobcd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binarytobcd
    PORT(
         binary_in : IN  std_logic_vector(3 downto 0);
         BCD_out : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal binary_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal BCD_out : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binarytobcd PORT MAP (
          binary_in => binary_in,
          BCD_out => BCD_out
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   tb : process
	begin
	
		binary_in <= "0000"; wait for 100 ns;
		binary_in <= "0001"; wait for 100 ns;
		binary_in <= "0010"; wait for 100 ns;
		binary_in <= "0011"; wait for 100 ns;
		binary_in <= "0100"; wait for 100 ns;
		binary_in <= "0101"; wait for 100 ns;
		binary_in <= "0110"; wait for 100 ns;
		binary_in <= "0111"; wait for 100 ns;
		binary_in <= "1000"; wait for 100 ns;
		binary_in <= "1001"; wait for 100 ns;
		binary_in <= "1010"; wait for 100 ns;
		binary_in <= "1011"; wait for 100 ns;
	
   end process;

END;