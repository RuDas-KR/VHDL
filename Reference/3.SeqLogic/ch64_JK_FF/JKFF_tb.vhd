--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:32:25 10/16/2009
-- Design Name:   
-- Module Name:   C:/test/EDA_LabII_Ex/JKFF/JKFF_tb.vhd
-- Project Name:  JKFF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: JKFF
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
 
ENTITY JKFF_tb IS
END JKFF_tb;
 
ARCHITECTURE behavior OF JKFF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT JKFF
    PORT(
         RST : IN  std_logic;
         J : IN  std_logic;
         K : IN  std_logic;
         CLK : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal J : std_logic := '0';
   signal K : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal q : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JKFF PORT MAP (
          RST => RST,
          J => J,
          K => K,
          CLK => CLK,
          q => q
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period := 1ns;
-- 
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100ms.
--      wait for 100ms;	
--
--      wait for <clock>_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

	tb_rst : process
	begin
		rst <= '0'; 
		wait for 20 ns;
		rst <= '1';
		wait;
	end process;
	
	tb_clk : process
	begin
		clk <= not clk;
		wait for 10 ns;
	end process;
	
	tb_jkff : process
	begin
		j <= '0';		k <= '1';
		wait for 50 ns;
		j <= '1';		k <= '0';
		wait for 50 ns;
		j <= '1';		k <= '1';
		wait for 100 ns;
		j <= '0';		k <= '0';
		wait for 50 ns;
	end process;
		





END;
