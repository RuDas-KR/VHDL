--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:59:36 10/30/2009
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/book_exam2/tb_cnt_8.vhd
-- Project Name:  book_exam2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cnt_8_ud
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
 
ENTITY tb_cnt_8 IS
END tb_cnt_8;
 
ARCHITECTURE behavior OF tb_cnt_8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cnt_8_ud
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
   uut: cnt_8_ud PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          q => q
        );

   -- Clock process definitions
   tb_clk :process
   begin
		clk <= '0';		wait for 10 ns;
		clk <= '1';		wait for 10 ns;
   end process;
 
   tb_rst :process
   begin
		rst <= '0';		wait for 100 ns;
		rst <= '1';		wait;
   end process;

   tb_en :process
   begin
		en <= '0';		wait for 25800 ns;
		en <= '1';		wait for 25800 ns;
   end process;

END;
