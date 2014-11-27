--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:29:08 12/22/2009
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/book_exam_3/tb_sl2_dm.vhd
-- Project Name:  book_exam_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SL2_DM
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
 
ENTITY tb_sl2_dm IS
END tb_sl2_dm;
 
ARCHITECTURE behavior OF tb_sl2_dm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SL2_DM
    PORT(
         clk : IN  std_logic;
         RSTB : IN  std_logic;
         R_data : OUT  std_logic;
         G_data : OUT  std_logic;
         addr_out : OUT  std_logic_vector(3 downto 0);
         enable : OUT  std_logic;
         latch : OUT  std_logic;
         clk_out : OUT  std_logic;
         red_en : IN  std_logic;
         green_en : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal RSTB : std_logic := '0';
   signal red_en : std_logic := '0';
   signal green_en : std_logic := '0';

 	--Outputs
   signal R_data : std_logic;
   signal G_data : std_logic;
   signal addr_out : std_logic_vector(3 downto 0);
   signal enable : std_logic;
   signal latch : std_logic;
   signal clk_out : std_logic;

   -- Clock period definitions
--   constant clk_period : time := 1us;
--   constant clk_out_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SL2_DM PORT MAP (
          clk => clk,
          RSTB => RSTB,
          R_data => R_data,
          G_data => G_data,
          addr_out => addr_out,
          enable => enable,
          latch => latch,
          clk_out => clk_out,
          red_en => red_en,
          green_en => green_en);

   -- Clock process definitions
	
	tb_clk :process
   begin
		clk <= '0';		wait for 10 ns;
		clk <= '1';		wait for 10 ns;
   end process;
 
   tb_rst :process
   begin
		rstb <= '0';		wait for 100 ns;
		rstb <= '1';		wait;
   end process;

   tb_green :process
   begin
		green_en <= '1';	wait for 690 us;
		green_en <= '0';	wait for 690 us;
   end process;

   tb_red :process
   begin
		red_en <= '0';		wait for 690 us;
		red_en <= '1';		wait for 690 us;
   end process;

END;
