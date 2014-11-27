--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:12:35 10/21/2009
-- Design Name:   
-- Module Name:   C:/test/EDA_LabII_Ex/Moore/moore_ex_tb.vhd
-- Project Name:  Moore
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: moore_ex
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
 
ENTITY moore_ex_tb IS
END moore_ex_tb;
 
ARCHITECTURE behavior OF moore_ex_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT moore_ex
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         X : IN  std_logic;
         Q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal X : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: moore_ex PORT MAP (
          CLK => CLK,
          RST => RST,
          X => X,
          Q => Q
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period := 1ns;
  --
  -- <clock>_process :process
  -- begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
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
  
  tp_rst : process
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
  
  tp_x : process
  begin
  	x <= not x;
  	wait for 60 ns;
  end process;
  	
  
END;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  