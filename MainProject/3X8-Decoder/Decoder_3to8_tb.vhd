--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:25:14 10/22/2009
-- Design Name:   
-- Module Name:   E:/ISE_Work/Project/EDA_LabII/Sample_Design/Chapter_5/Decoder_3to8/Decoder_3to8_tb.vhd
-- Project Name:  Decoder_3to8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder_3to8
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
 
ENTITY Decoder_3to8_tb IS
END Decoder_3to8_tb;
 
ARCHITECTURE behavior OF Decoder_3to8_tb IS 
    COMPONENT Decoder_3to8
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal D : std_logic_vector(7 downto 0);
 	 
 	 signal clk : std_logic := '0';
 	 signal data : std_logic_vector (2 downto 0) := "000";
 	 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder_3to8 PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D
        );

clk <= not clk after 10 ns;
 
   -- Stimulus process
   stim_proc: process(clk)
   begin		
		if rising_edge (clk) then
			data <= data + 1;
		end if;
   end process;

	C <= data(0);
	B <= data(1);
	A <= data(2);

END;
