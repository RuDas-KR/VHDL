--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:42:57 10/22/2009
-- Design Name:   
-- Module Name:   E:/ISE_Work/Project/EDA_LabII/Sample_Design/Chapter_5/Encoder_8to3/Encoder_8to3_tb.vhd
-- Project Name:  Encoder_8to3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Encoder_8to3
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
 
ENTITY Encoder_8to3_tb IS
END Encoder_8to3_tb;
 
ARCHITECTURE behavior OF Encoder_8to3_tb IS 
    COMPONENT Encoder_8to3
    PORT(
         D : IN  std_logic_vector(7 downto 0);
         X : OUT  std_logic;
         Y : OUT  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(7 downto 0) := "00000001";

 	--Outputs
   signal X : std_logic;
   signal Y : std_logic;
   signal Z : std_logic;
 
 	 signal clk : std_logic := '0';

BEGIN
 
 	clk <= not clk after 20ns;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder_8to3 PORT MAP (
          D => D,
          X => X,
          Y => Y,
          Z => Z
        );
 
   -- Stimulus process
   stim_proc: process(clk)
   begin		
		if rising_edge (clk) then
			D <= D(6 downto 0) & D(7);
		end if;
   end process;

END;
