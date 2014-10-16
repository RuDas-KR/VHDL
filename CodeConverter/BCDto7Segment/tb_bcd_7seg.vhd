--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_bcd_7seg IS
END tb_bcd_7seg;
 
ARCHITECTURE behavior OF tb_bcd_7seg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd_7seg
    PORT(
         bcd : IN  std_logic_vector(7 downto 0);
         digit : OUT  std_logic_vector(6 downto 1);
         s7segment : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal bcd : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal digit : std_logic_vector(6 downto 1);
   signal s7segment : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd_7seg PORT MAP (
          bcd => bcd,
          digit => digit,
          s7segment => s7segment
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   tb : process
	begin
	bcd <= "00000000"; wait for 50ns;
	bcd <= "00000001"; wait for 50ns;
	bcd <= "00000010"; wait for 50ns;
	bcd <= "00000011"; wait for 50ns;
	bcd <= "00000100"; wait for 50ns;
	bcd <= "00000101"; wait for 50ns;
	bcd <= "00000110"; wait for 50ns;
	bcd <= "00000111"; wait for 50ns;
	bcd <= "00001000"; wait for 50ns;
	bcd <= "00001001"; wait for 50ns;
	
	bcd <= "00010000"; wait for 50ns;
	bcd <= "00010000"; wait for 50ns;
	bcd <= "00010010"; wait for 50ns;
	bcd <= "00010011"; wait for 50ns;
	bcd <= "00010100"; wait for 50ns;
	bcd <= "00010101"; wait for 50ns;
	end process;

END;
