--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:59:09 10/21/2009
-- Design Name:   
-- Module Name:   E:/ISE_Work/Project/EDA_LabII/Sample_Design/Chapter_5/MUX_4to1/MUX_4to1_tb.vhd
-- Project Name:  MUX_4to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_4to1
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
 
ENTITY MUX_4to1_tb IS
END MUX_4to1_tb;
 
ARCHITECTURE behavior OF MUX_4to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_4to1
    PORT(
         D0 : IN  std_logic;
         D1 : IN  std_logic;
         D2 : IN  std_logic;
         D3 : IN  std_logic;
         S : IN  std_logic_vector(1 downto 0);
         X : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D0 : std_logic := '0';
   signal D1 : std_logic := '0';
   signal D2 : std_logic := '0';
   signal D3 : std_logic := '0';
   signal S : std_logic_vector(1 downto 0) := (others => '0');
	 
 	--Outputs
   signal X : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_4to1 PORT MAP (
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          S => S,
          X => X
        );
 
 D0 <= not D0 after 20 ns;
 D1 <= not D1 after 60 ns;
 D2 <= not D2 after 100 ns;
 D3 <= not D3 after 160 ns;

   -- Stimulus process
   proc_sel : process
   begin		

      wait for 500 ns;	
			S <= "01";

      wait for 500 ns;	
			S <= "10";

      wait for 500 ns;	
			S <= "11";

      wait;
   end process;

END;
