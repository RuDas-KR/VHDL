--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:16:34 02/26/2010
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/EDA_LabII_EXM/CH13_Memory/rom_test/rom_test_top_tb.vhd
-- Project Name:  ROM_16x8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rom_test_top
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
 
ENTITY rom_test_top_tb IS
END rom_test_top_tb;
 
ARCHITECTURE behavior OF rom_test_top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rom_test_top
    PORT(
         clk_100m : IN  std_logic;
         dip_sw : IN  std_logic_vector(3 downto 0);
         LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_100m : std_logic := '0';
   signal dip_sw : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_100m_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rom_test_top PORT MAP (
          clk_100m => clk_100m,
          dip_sw => dip_sw,
          LED => LED
        );

   -- Clock process definitions
   tb_clk_100m :process
   begin
		clk_100m <= '0';		wait for clk_100m_period/2;
		clk_100m <= '1';		wait for clk_100m_period/2;
   end process;

   tb_dip_sw :process
   begin
   dip_sw <= "0000";		wait for clk_100m_period*10;
   dip_sw <= "0001";		wait for clk_100m_period*10;		
   dip_sw <= "0010";		wait for clk_100m_period*10;
   dip_sw <= "0011";		wait for clk_100m_period*10;
   dip_sw <= "0100";		wait for clk_100m_period*10;
   dip_sw <= "0101";		wait for clk_100m_period*10;
   dip_sw <= "0110";		wait for clk_100m_period*10;
   dip_sw <= "0111";		wait for clk_100m_period*10;
   dip_sw <= "1000";		wait for clk_100m_period*10;	
   dip_sw <= "1001";		wait for clk_100m_period*10;
   dip_sw <= "1010";		wait for clk_100m_period*10;
	dip_sw <= "1011";		wait for clk_100m_period*10;
	dip_sw <= "1100";		wait for clk_100m_period*10;
	dip_sw <= "1101";		wait for clk_100m_period*10;
	dip_sw <= "1110";		wait for clk_100m_period*10;
	dip_sw <= "1111";		wait for clk_100m_period*10; wait;
   end process;
		
END;
