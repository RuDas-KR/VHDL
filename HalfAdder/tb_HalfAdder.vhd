--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_HalfAdder IS
END tb_HalfAdder;
 
ARCHITECTURE behavior OF tb_HalfAdder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HalfAdder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         sum : OUT  std_logic;
         carrier : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal sum : std_logic;
   signal carrier : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HalfAdder PORT MAP (
          A => A,
          B => B,
          sum => sum,
          carrier => carrier
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	tb : PROCESS
	
	BEGIN
	
	A <= '0'; B <= '0'; wait for 100ns;
	A <= '0'; B <= '1'; wait for 100ns;
	A <= '1'; B <= '0'; wait for 100ns;
	A <= '1'; B <= '1'; wait for 100ns;
	
	END PROCESS;
	
END;
