----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dps_test is
	port (	clk	: in std_logic;
				rst	: in std_logic;
				q		: in std_logic_vector(3 downto 0);
				seg	: out std_logic_vector(7 downto 0);
				digit	: out std_logic_vector(5 downto 0)
				);
end dps_test;

architecture Behavioral of dps_test is

	component seg_7
					port	(	Q	: in std_logic_vector(3 downto 0);
								SEG : out std_logic_vector(7 downto 0)
								);
	end component;
	
	component SEG_SCAN
					port	(	CLK	:	in std_logic;
								RSK	:	in std_logic;
								DIGIT :	out std_logic_vector(5 downto 0)
								);
	end component;
	
	signal FPGA_RST_TMP : STD_LOGIC;
	SIGNAL FPGA_CLK_TMP1	: STD_LOGIC;
	SIGNAL FPGA_CLK_TMP	: STD_LOGIC;

begin

	FPGA_RST_TMP <= not rst;
	
	C1: IBUF port map (i => CLK, o => FPGA_CLK_TMP1);
	C2: BUFG port map (i => FPGA_CLK_TMP1, o => FPGA_CLK_TMP);
	
	u1	:	seg_7 port map	(	q => q,
									seg => SEG	);
									
	u2 : seg_scan port map	(	clk => FPGA_CLK_TMP,
										RST => FPGA_RST_TMP,
										digit => digit	);

end Behavioral;

