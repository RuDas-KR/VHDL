--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:54:51 10/22/2009
-- Design Name:   
-- Module Name:   E:/ISE_Work/Project/EDA_LabII/Sample_Design/Chapter_12/PSnSegment/PSnSegment_Top_tb.vhd
-- Project Name:  PSnSegment
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PS2nSegment_Top
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
 
ENTITY PSnSegment_Top_tb IS
END PSnSegment_Top_tb;
 
ARCHITECTURE behavior OF PSnSegment_Top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PS2nSegment_Top
    PORT(
         FPGA_RSTB : IN  std_logic;
         FPGA_GCLK1 : IN  std_logic;
         KEY_CLK : IN  std_logic;
         KEY_DATA : IN  std_logic;
         DIGIT : OUT  std_logic_vector(6 downto 1);
         SEG_A : OUT  std_logic;
         SEG_B : OUT  std_logic;
         SEG_C : OUT  std_logic;
         SEG_D : OUT  std_logic;
         SEG_E : OUT  std_logic;
         SEG_F : OUT  std_logic;
         SEG_G : OUT  std_logic;
         SEG_DP : OUT  std_logic;
         LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
COMPONENT PS2_Model
	port (
				RSTB     : in std_logic;
				CLK      : in std_logic;
				PS2_CLK  : out std_logic;
				PS2_DATA : out std_logic
				);				
end COMPONENT;

   --Inputs
   signal FPGA_RSTB : std_logic := '0';
   signal FPGA_GCLK1 : std_logic := '0';
   signal KEY_CLK : std_logic := '0';
   signal KEY_DATA : std_logic := '0';

 	--Outputs
   signal DIGIT : std_logic_vector(6 downto 1);
   signal SEG_A : std_logic;
   signal SEG_B : std_logic;
   signal SEG_C : std_logic;
   signal SEG_D : std_logic;
   signal SEG_E : std_logic;
   signal SEG_F : std_logic;
   signal SEG_G : std_logic;
   signal SEG_DP : std_logic;
   signal LED : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PS2nSegment_Top PORT MAP (
          FPGA_RSTB => FPGA_RSTB,
          FPGA_GCLK1 => FPGA_GCLK1,
          KEY_CLK => KEY_CLK,
          KEY_DATA => KEY_DATA,
          DIGIT => DIGIT,
          SEG_A => SEG_A,
          SEG_B => SEG_B,
          SEG_C => SEG_C,
          SEG_D => SEG_D,
          SEG_E => SEG_E,
          SEG_F => SEG_F,
          SEG_G => SEG_G,
          SEG_DP => SEG_DP,
          LED => LED
        );


u_PS2_Model : PS2_Model
	port map (
				RSTB     => FPGA_RSTB,	
				CLK      => FPGA_GCLK1,	
				PS2_CLK  => KEY_CLK,	
				PS2_DATA => KEY_DATA	
				);				

FPGA_GCLK1 <= not FPGA_GCLK1 after 5ns;

   -- Stimulus process
   stim_proc: process
   begin		

      FPGA_RSTB <= '0';
      wait for 40ns;	

			FPGA_RSTB <= '1';
      wait;
   end process;

END;
