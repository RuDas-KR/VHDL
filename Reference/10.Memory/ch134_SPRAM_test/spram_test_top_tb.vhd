--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:45:32 03/04/2010
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/EDA_LabII_EXM/CH13_Memory/spram_test/spram_test_top_tb.vhd
-- Project Name:  SPRAM_16x4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: spram_test_top
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
 
ENTITY spram_test_top_tb IS
END spram_test_top_tb;
 
ARCHITECTURE behavior OF spram_test_top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT spram_test_top
    PORT(
         clk100m : IN  std_logic;
         push_sw : IN  std_logic;
         dip_sw  : IN  std_logic_vector(7 downto 0);
         led     : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk100m : std_logic := '0';
   signal push_sw : std_logic := '0'; 
   signal dip_sw  : std_logic_vector(7 downto 0) := (others => '0');
 
 	--Outputs
   signal led : std_logic_vector(3 downto 0);

   signal i   : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk100m_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: spram_test_top PORT MAP (
          clk100m => clk100m,
          push_sw => push_sw,
          dip_sw  => dip_sw,
          led     => led
        );

   -- Clock process definitions
   clk100m_process :process
   begin
		clk100m <= '0';		wait for clk100m_period/2;
		clk100m <= '1';		wait for clk100m_period/2;
   end process;

   stim_proc :process
   begin
		push_sw <= '1';
		dip_sw  <= "11111111"; -- data & address
		i <= "00000";
		wait for clk100m_period*10;
	
	loop 
	--spram wirte
	if (i < "100000") then
		push_sw <= '1';
		dip_sw(3 downto 0) <= not i(3 downto 0); --address(0~F)
		dip_sw(7 downto 4) <= i(3 downto 0);     --data(F~0)
		wait for clk100m_period*1;
		push_sw <= '0'; -- set write enable
	end if;
	
	--spram read
	
	if (i > "01111") then
		dip_sw(3 downto 0) <= not i(3 downto 0); --address(0~F)
		dip_sw(7 downto 4) <= "0000";     --data
		wait for clk100m_period*1;
	end if;
		i <= i + "0001";
		wait for clk100m_period*1;
	end loop;
   end process; 
END;
