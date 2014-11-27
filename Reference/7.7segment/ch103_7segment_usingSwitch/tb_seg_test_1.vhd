--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:00:55 12/21/2009
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/book_exam_3/tb_seg_test_1.vhd
-- Project Name:  book_exam_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seg_test_1
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
 
ENTITY tb_seg_test_1 IS
END tb_seg_test_1;
 
ARCHITECTURE behavior OF tb_seg_test_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seg_test_1
    PORT(
         push : IN  std_logic_vector(3 downto 0);
         dip : IN  std_logic_vector(7 downto 0);
         digit : OUT  std_logic_vector(5 downto 0);
         seg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal push : std_logic_vector(3 downto 0) := (others => '0');
   signal dip : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal digit : std_logic_vector(5 downto 0);
   signal seg : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seg_test_1 PORT MAP (
          push  => push,
          dip   => dip,
          digit => digit,
          seg   => seg
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period := 1ns;
 
   push_dip_tb :process
   begin
		push <= "1000";  dip  <= "00000000"; wait for 100 ns;
		push <= "0100";  dip  <= "00000000"; wait for 100 ns;
		push <= "0010";  dip  <= "00000000"; wait for 100 ns;
		push <= "0001";  dip  <= "00000000"; wait for 100 ns;
		push <= "0000";  dip  <= "10000000"; wait for 100 ns;
		push <= "0000";  dip  <= "01000000"; wait for 100 ns;
		push <= "0000";  dip  <= "00100000"; wait for 100 ns;
		push <= "0000";  dip  <= "00010000"; wait for 100 ns;
		push <= "0000";  dip  <= "00001000"; wait for 100 ns;
		push <= "0000";  dip  <= "00000100"; wait for 100 ns;		
		push <= "0000";  dip  <= "00000010"; wait for 100 ns;
		push <= "0000";  dip  <= "00000010"; wait for 100 ns;
		push <= "0000";  dip  <= "00000001"; wait for 100 ns;		
   end process;
 
END;
