--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:01:12 10/22/2009
-- Design Name:   
-- Module Name:   E:/ISE_Work/Project/EDA_LabII/Sample_Design/Chapter_5/half_adder/half_adder_tb.vhd
-- Project Name:  half_adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: half_adder
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
 
ENTITY half_adder_tb IS
END half_adder_tb;
 
ARCHITECTURE behavior OF half_adder_tb IS 
    COMPONENT half_adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal C : std_logic;

 	 signal clk : std_logic := '0';
 	 signal data : std_logic_vector (1 downto 0) := "00";
 
BEGIN

 	clk <= not clk after 20ns;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: half_adder PORT MAP (
          A => A,
          B => B,
          S => S,
          C => C
        );
 
   -- Stimulus process
   stim_proc: process(clk)
   begin		
		if rising_edge (clk) then
			data <= data + 1;
		end if;
   end process;

A <= data(0);
B <= data(1);

END;
