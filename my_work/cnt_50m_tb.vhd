--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:08:09 10/22/2014
-- Design Name:   
-- Module Name:   D:/21133971_ckh/bcd_to_7segment/My_work/my_work/my_work/cnt_50m_tb.vhd
-- Project Name:  my_work
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cnt_50m
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
 
ENTITY cnt_50m_tb IS
END cnt_50m_tb;
 
ARCHITECTURE behavior OF cnt_50m_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cnt_50m
    PORT(
         aclr : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic_vector(15 downto 0);
         clk_1khz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal aclr : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(15 downto 0);
   signal clk_1khz : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1us;
   constant clk_1khz_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cnt_50m PORT MAP (
          aclr => aclr,
          clk => clk,
          q => q,
          clk_1khz => clk_1khz
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   clk_1khz_process :process
   begin
		clk_1khz <= '0';
		wait for clk_1khz_period/2;
		clk_1khz <= '1';
		wait for clk_1khz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 100ms;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
