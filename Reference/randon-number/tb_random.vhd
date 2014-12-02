--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:02:44 11/14/2014
-- Design Name:   
-- Module Name:   D:/hg/random_number/tb_random.vhd
-- Project Name:  random_number
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: random0_9
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
 
ENTITY tb_random IS
END tb_random;
 
ARCHITECTURE behavior OF tb_random IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT random0_9
    PORT(
         x : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         BCD : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal BCD : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: random0_9 PORT MAP (
          x => x,
          rst => rst,
          clk => clk,
          BCD => BCD
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
  
   rst <= '0';
	x <= '0';
	wait for 20 ns;
	   rst <= '1';
	x <= '0';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;
	x <= '1';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;
		x <= '0';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;
	x <= '0';
	wait for 20 ns;

   end process;

END;
