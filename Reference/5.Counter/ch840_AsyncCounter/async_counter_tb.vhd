--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:09:54 02/26/2010
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/EDA_LabII_EXM/CH8_counter/async_counter_tb.vhd
-- Project Name:  CH8_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: async_counter
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
 
ENTITY async_counter_tb IS
END async_counter_tb;
 
ARCHITECTURE behavior OF async_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT async_counter
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         bcd_100k : OUT  std_logic_vector(3 downto 0);
         bcd_10k : OUT  std_logic_vector(3 downto 0);
         bcd_1k : OUT  std_logic_vector(3 downto 0);
         clk_100k : OUT  std_logic;
         clk_10k : OUT  std_logic;
         clk_1k : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal bcd_100k : std_logic_vector(3 downto 0);
   signal bcd_10k : std_logic_vector(3 downto 0);
   signal bcd_1k : std_logic_vector(3 downto 0);
   signal clk_100k : std_logic;
   signal clk_10k : std_logic;
   signal clk_1k : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 1us;
   constant clk_100k_period : time := 1us;
   constant clk_10k_period : time := 1us;
   constant clk_1k_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: async_counter PORT MAP (
          clk_in => clk_in,
          reset => reset,
          bcd_100k => bcd_100k,
          bcd_10k => bcd_10k,
          bcd_1k => bcd_1k,
          clk_100k => clk_100k,
          clk_10k => clk_10k,
          clk_1k => clk_1k
        );

   -- Clock process definitions
   tb_clk_in :process
   begin
		clk_in <= '0';		wait for 10 ns;
		clk_in <= '1';		wait for 10 ns;
   end process;
 
   tb_reset :process
   begin
		reset <= '0';		wait for 100 ns;
		reset <= '1';		wait;
   end process;
 




END;
