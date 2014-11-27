--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:37:15 02/26/2010
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/EDA_LabII_EXM/CH8_counter/cnt8e_tb.vhd
-- Project Name:  CH8_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cnt8e
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
 
ENTITY cnt8e_tb IS
END cnt8e_tb;
 
ARCHITECTURE behavior OF cnt8e_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cnt8e
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cnt8e PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          q => q
        );

   -- Clock process definitions
   tb_clk :process
   begin
		clk <= '0';		wait for 50 ns;
		clk <= '1';		wait for 50 ns;
   end process;
 
   tb_rst :process
   begin
		rst <= '0';		wait for 100 ns;
		rst <= '1';		wait for 1120 ns;
		rst <= '0';		wait for 50 ns;
		rst <= '1';		wait;
   end process;

   tb_en :process
   begin
		en <= '0';		wait for 200 ns;
		en <= '1';		wait for 350 ns;
		en <= '0';		wait for 250 ns;
		en <= '1';		wait for 200 ns;
		en <= '0';		wait for 500 ns;	
		en <= '1';		wait;		
   end process;	
	
	

END;
