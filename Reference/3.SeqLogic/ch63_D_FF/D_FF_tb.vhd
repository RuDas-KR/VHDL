--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:15:52 10/15/2009
-- Design Name:   
-- Module Name:   C:/test/EDA_LabII_Ex/D_FF/D_FF_tb.vhd
-- Project Name:  D_FF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: D_FF
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
 
ENTITY D_FF_tb IS
END D_FF_tb;
 
ARCHITECTURE behavior OF D_FF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_FF
    PORT(
         D : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic;
         Qb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qb : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_FF PORT MAP (
          D => D,
          CLK => CLK,
          Q => Q,
          Qb => Qb
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
-- constant <clock>_period := 1ns;
--
-- <clock>_process :process
-- begin
--<clock> <= '0';
--wait for <clock>_period/2;
--<clock> <= '1';
--wait for <clock>_period/2;
-- end process;
--
--
-- -- Stimulus process
-- stim_proc: process
-- begin		
--    -- hold reset state for 100ms.
--    wait for 100ms;	
--
--    wait for <clock>_period*10;
--
--    -- insert stimulus here 
--
--    wait;
-- end process;

tb_clk : process
begin
	clk <= not clk;
	wait for 15 ns;
end process;

tb_d : process
begin
	D <= '1'; 
	wait for 50 ns;
	D <= '0';
	wait for 50 ns;
end process;

	



END;
