--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:37:42 10/16/2009
-- Design Name:   
-- Module Name:   C:/test/EDA_LabII_Ex/T_FF/TFF_tb.vhd
-- Project Name:  T_FF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TFF
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
 
ENTITY TFF_tb IS
END TFF_tb;
 
ARCHITECTURE behavior OF TFF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TFF
    PORT(
         RST : IN  std_logic;
         T : IN  std_logic;
         CLK : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal T : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal q : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TFF PORT MAP (
          RST => RST,
          T => T,
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
		wait for 25 ns;
	end process;
	
	tb_t : process
	begin
		t <= '1';
		wait for 500 ns;
		t <= '0';
		wait;
	end process;





END;
