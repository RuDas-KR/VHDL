--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:39:22 12/21/2009
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/book_exam_3/tb_test_led_cnt.vhd
-- Project Name:  book_exam_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_led_cnt
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
 
ENTITY tb_test_led_cnt IS
END tb_test_led_cnt;
 
ARCHITECTURE behavior OF tb_test_led_cnt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_led_cnt
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
--   constant clk_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_led_cnt PORT MAP (
          clk => clk,
          rst => rst,
          led => led
        );

   -- Clock process definitions
   tb_clk :process
   begin
		clk <= '0';		wait for 5 ns;
		clk <= '1';		wait for 5 ns;
   end process;
 
   tb_rst :process
   begin
		rst <= '0';		wait for 100 ns;
		rst <= '1';		wait;
   end process;

END;
