--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:58:39 10/15/2009
-- Design Name:   
-- Module Name:   C:/test/EDA_LabII_Ex/Flip_Flop/RS_FF_tb.vhd
-- Project Name:  Flip_Flop
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RS_FF
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
 
ENTITY RS_FF_tb IS
END RS_FF_tb;
 
ARCHITECTURE behavior OF RS_FF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_FF
    PORT(
         RST : IN  std_logic;
         R : IN  std_logic;
         S : IN  std_logic;
         CP : IN  std_logic;
         q : OUT  std_logic;
         qb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal R : std_logic := '0';
   signal S : std_logic := '0';
   signal CP : std_logic := '0';

 	--Outputs
   signal q : std_logic;
   signal qb : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_FF PORT MAP (
          RST => RST,
          R => R,
          S => S,
          CP => CP,
          q => q,
          qb => qb
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
                         
                         
	tb_RST : process
	begin
		RST <= '0' ;
		wait for 20 ns;
		RST <= '1' ;
		wait;
	end process;
	
	tb_S_R: process
	begin
		S <= '0';		R <= '1';
		wait for 50 ns;
		S <= '1';		R <= '0';
		wait for 50 ns;
		S <= '0';		R <= '0';
		wait for 50 ns;
		S <= '0';		R <= '1';
		wait for 50 ns;
		S <= '1';		R <= '0';
		wait for 50 ns;
		S <= '0';		R <= '0';
		wait for 50 ns;
	end process;
	
	tb_CP : process
	begin
		CP <= not CP;
		wait for 15 ns;
	end process;
		
                         
                         

                         
END;
