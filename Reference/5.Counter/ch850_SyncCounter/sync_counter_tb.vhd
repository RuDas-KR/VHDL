--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:38:05 02/26/2010
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/EDA_LabII_EXM/CH8_counter/sync_counter_tb.vhd
-- Project Name:  CH8_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sync_counter
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
 
ENTITY sync_counter_tb IS
END sync_counter_tb;
 
ARCHITECTURE behavior OF sync_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sync_counter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         clk_100k : OUT  std_logic;
         clk_10k : OUT  std_logic;
         clk_1k : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal clk_100k : std_logic;
   signal clk_10k : std_logic;
   signal clk_1k : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1us;
   constant clk_100k_period : time := 1us;
   constant clk_10k_period : time := 1us;
   constant clk_1k_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sync_counter PORT MAP (
          clk => clk,
          reset => reset,
          clk_100k => clk_100k,
          clk_10k => clk_10k,
          clk_1k => clk_1k
        );

   -- Clock process definitions
   tb_clk :process
   begin
		clk <= '0';		wait for 10 ns;
		clk <= '1';		wait for 10 ns;
   end process;
 
   tb_reset :process
   begin
		reset <= '0';		wait for 100 ns;
		reset <= '1';		wait;
   end process;


END;
