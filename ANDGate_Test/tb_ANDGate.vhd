--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:59:08 09/12/2014
-- Design Name:   
-- Module Name:   D:/VHDL/ANDGate_Test/tb_ANDGate.vhd
-- Project Name:  ANDGate_Test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ANDGate
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_ANDGate IS
END tb_ANDGate;
 
ARCHITECTURE behavior OF tb_ANDGate IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ANDGate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ANDGate PORT MAP (
          A => A,
          B => B,
          Y => Y
        );
		  
	tb : process
	
	begin
	
	A <= '0'; B <= '0'; wait for 50ns;
	A <= '0'; B <= '1'; wait for 50ns;
	A <= '1'; B <= '0'; wait for 50ns;
	A <= '1'; B <= '1'; wait for 50ns;
	
	
   end process;

END;
