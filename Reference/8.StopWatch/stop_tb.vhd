--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:30:57 02/26/2010
-- Design Name:   
-- Module Name:   C:/proj/EDA_Lab_II/EDA_LabII_EXM/CH11_StopWatch/stop_tb.vhd
-- Project Name:  StopWatch_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: StopWatch_02
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
 
ENTITY stop_tb IS
END stop_tb;
 
ARCHITECTURE behavior OF stop_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT StopWatch_02
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         push1 : IN  std_logic;
         push2 : IN  std_logic;
         digit : OUT  std_logic_vector(1 to 6);
         seg : OUT  std_logic_vector(6 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal push1 : std_logic := '0';
   signal push2 : std_logic := '0';

 	--Outputs
   signal digit : std_logic_vector(1 to 6);
   signal seg : std_logic_vector(6 downto 0);
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: StopWatch_02 PORT MAP (
          clk => clk,
          reset => reset,
          push1 => push1,
          push2 => push2,
          digit => digit,
          seg => seg,
          led => led
        );

   -- Clock process definitions
   tb_clk :process
   begin
		clk <= '0';		wait for 50 ns;
		clk <= '1';		wait for 50 ns;
   end process;
 
   tb_reset :process
   begin
		reset <= '0';		wait for 100 ns;
		reset <= '1';		wait;
   end process;

   tb_push1 :process
   begin
		push1 <= '1';		wait for 200 ns;
		push1 <= '0';		wait for 180 ns;
		push1 <= '1';		wait;
   end process;	

   tb_push2 :process
   begin
		push2 <= '1';		wait for 1000 ns;
		push2 <= '0';		wait for 360 ns;
		push2 <= '1';		wait for 12000 ns;
		push2 <= '0';		wait for 410 ns;
		push2 <= '1';		wait;
   end process;		

END;
