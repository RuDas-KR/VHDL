--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:03:14 03/04/2010
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/EDA_LabII_EXM/CH13_Memory/fifo_test/fifo_test_top_tb.vhd
-- Project Name:  FIFO_256x4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo_test_top
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
 
ENTITY fifo_test_top_tb IS
END fifo_test_top_tb;
 
ARCHITECTURE behavior OF fifo_test_top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fifo_test_top
    PORT(
         clk100m : IN  std_logic;
         rstb : IN  std_logic;
         push_sw : IN  std_logic_vector(1 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk100m : std_logic := '0';
   signal rstb : std_logic := '0';
   signal push_sw : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk100m_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo_test_top PORT MAP (
          clk100m => clk100m,
          rstb => rstb,
          push_sw => push_sw,
          led => led
        );

   -- Clock process definitions
   clk100m_process :process
   begin
		clk100m <= '0';		wait for clk100m_period/2;
		clk100m <= '1';		wait for clk100m_period/2;
   end process;

   stim_process :process
   begin
	--start
		rstb <= '0'; 	wait for clk100m_period*20;
		rstb <= '1'; 	wait for clk100m_period*20;

	--FIFO Write enable
		push_sw(0) <= '0'; wait for clk100m_period*200;
	--Release
		push_sw(0) <= '1'; wait for clk100m_period*20;
	--FIFO Read enable
		push_sw(1) <= '0'; wait for clk100m_period*200;
	--Release
		push_sw(1) <= '1'; wait for clk100m_period*20;
	--end
--	wait;
   end process; 
END;
