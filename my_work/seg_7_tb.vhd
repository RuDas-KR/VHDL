
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY seg_7_seg_7_tb_vhd_tb IS
END seg_7_seg_7_tb_vhd_tb;
 
ARCHITECTURE behavior OF seg_7_seg_7_tb_vhd_tb IS 
 
    COMPONENT seg_7
    PORT(
         Q : IN  std_logic_vector(3 downto 0);
         SEG : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal Q  : std_logic_vector(3 downto 0);
   signal SEG : std_logic_vector(7 downto 0);
	
BEGIN
 
   uut: seg_7 PORT MAP (
          Q => Q,
          SEG => SEG
        );

tb : process
	BEGIN
			q <=x"0";		wait for 100 ns;
			q <=x"1";		wait for 100 ns;
			q <=x"2";		wait for 100 ns;
			q <=x"3";		wait for 100 ns;
			q <=x"4";		wait for 100 ns;
			q <=x"5";		wait for 100 ns;
			q <=x"6";		wait for 100 ns;
			q <=x"7";		wait for 100 ns;
			q <=x"8";		wait for 100 ns;
			q <=x"9";		wait for 100 ns;
			q <=x"a";		wait for 100 ns;
			q <=x"b";		wait for 100 ns;
			q <=x"c";		wait for 100 ns;
			q <=x"d";		wait for 100 ns;
			q <=x"e";		wait for 100 ns;
			q <=x"f";		wait; -- will wait forever
	END PROCESS;
END;
