--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:40:12 10/22/2009
-- Design Name:   
-- Module Name:   C:/test/EDA_LabII_Ex/door_lock/door_lock_tb.vhd
-- Project Name:  door_lock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: door_lock
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
 
ENTITY door_lock_tb IS
END door_lock_tb;
 
ARCHITECTURE behavior OF door_lock_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT door_lock
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         ps_start : IN  std_logic;
         ps_end : IN  std_logic;
         ps_num : IN  std_logic_vector(3 downto 0);
         door_Open : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal ps_start : std_logic := '0';
   signal ps_end : std_logic := '0';
   signal ps_num : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal door_Open : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: door_lock PORT MAP (
          CLK => CLK,
          RST => RST,
          ps_start => ps_start,
          ps_end => ps_end,
          ps_num => ps_num,
          door_Open => door_Open
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
		wait for 10 ns;
		rst <= '1';
		wait;
	end process;
	
  tb_clk : process
  begin      
  	clk <= not clk; 
  	wait for 10 ns; 
  end process;
  
  tb_ps_start : process
  begin
  	ps_start <= '1'; 	wait for 30 ns;
  	ps_start <= '0'; 	wait for 20 ns;
  	ps_start <= '1'; 	wait for 100 ns;
  	ps_start <= '0'; 	wait for 20 ns;
  	ps_start <= '1'; 	wait ;
  end process;
  
  tb_ps_end : process
  begin
  	ps_end <= '1'; 	wait for 70 ns;
  	ps_end <= '0'; 	wait for 20 ns;
  	ps_end <= '1'; 	wait for 100 ns;
  	ps_end <= '0'; 	wait for 20 ns;
  	ps_end <= '1';   wait;
  end process;
  
  tb_ps_num : process
  begin
  	ps_num <= "0000"; wait for 80 ns;
  	ps_num <= "1111"; wait for 40 ns;
  	ps_num <= "0000"; wait for 80 ns;
  	ps_num <= "1001"; wait for 40 ns;
  	ps_num <= "0000"; wait;
  end process;
  	
  	      



END;
