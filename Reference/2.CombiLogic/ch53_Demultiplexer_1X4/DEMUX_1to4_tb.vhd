--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:18:12 10/22/2009
-- Design Name:   
-- Module Name:   E:/ISE_Work/Project/EDA_LabII/Sample_Design/Chapter_5/DEMUX_1to4/DEMUX_1to4_tb.vhd
-- Project Name:  DEMUX_1to4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DEMUX_1to4
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
 
ENTITY DEMUX_1to4_tb IS
END DEMUX_1to4_tb;
 
ARCHITECTURE behavior OF DEMUX_1to4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DEMUX_1to4
    PORT(
         D : IN  std_logic;
         S : IN  std_logic_vector(1 downto 0);
         X0 : OUT  std_logic;
         X1 : OUT  std_logic;
         X2 : OUT  std_logic;
         X3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal X0 : std_logic;
   signal X1 : std_logic;
   signal X2 : std_logic;
   signal X3 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DEMUX_1to4 PORT MAP (
          D => D,
          S => S,
          X0 => X0,
          X1 => X1,
          X2 => X2,
          X3 => X3
        );
 
 D <= not D after 20 ns;
 
   -- Stimulus process
   proc_sel : process
   begin		

      wait for 100ns;	
			S <= "01";

      wait for 100ns;	
			S <= "10";

      wait for 100ns;	
			S <= "11";

      wait;
   end process;

END;
