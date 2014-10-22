
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity my_work is
    Port ( FPGA_CLK : in  STD_LOGIC;
           FPGA_RST : in  STD_LOGIC;
           DIGIT : out  STD_LOGIC_VECTOR (5 downto 0);
           SEG : out  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end my_work;

architecture Behavioral of my_work is
component cnt_50m
	port ( aclr			: in STD_LOGIC;
			 clk			: in STD_LOGIC;
			 q				: out STD_LOGIC_VECTOR (15 DOWNTO 0);
			 clk_1khz	: out STD_LOGIC);
end component;

component cnt_500
	port ( aclr			: in STD_LOGIC;
			 clk			: in STD_LOGIC;
			 q				: out STD_LOGIC_VECTOR (8 DOWNTO 0);
			 clk_2hz		: out STD_LOGIC);
end component;

component seg_7
	port ( Q			: in STD_LOGIC_VECTOR(3 DOWNTO 0);
			 SEG		: out STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

component cnt_10
	port ( CLK			: in STD_LOGIC;
			 RST			: in STD_LOGIC;
			 Q				: out STD_LOGIC_VECTOR (3 DOWNTO 0));
end component;

component SEG_SCAN
	port ( CLK			: in STD_LOGIC;
			 RST			: in STD_LOGIC;
			 DIGIT		: out STD_LOGIC_VECTOR (5 DOWNTO 0));
end component;

component LED_8
	port ( Q				: in STD_LOGIC_VECTOR(3 DOWNTO 0);
			 LED			: out STD_LOGIC_VECTOR (7 DOWNTO 0));
end component;

signal Q_TMP			: std_logic_vector (3 downto 0);
signal CLK_2HZ			: std_logic;
signal CLK_1KHZ		: std_logic;
signal FPGA_RST_TMP	: std_logic;

component BUFGP
	port ( i : in std_logic;
			 o : out std_logic
			 );
end component;

signal FPGA_CLK_TMP : std_logic;

begin
u10 : BUFGP
	port map( i => FPGA_CLK,
				 o => FPGA_CLK_TMP
				);
		
FPGA_RST_TMP <= not FPGA_RST;

u1 : cnt_50m
	port map(
		aclr	=> FPGA_RST_TMP,
		clk	=> FPGA_CLK_TMP,
		q		=> open,
		clk_1khz	=> CLK_1KHZ
		);
		
u2 : cnt_500
	port map(
		aclr	=> FPGA_RST_TMP,
		clk	=> CLK_1KHZ,
		q		=> open,
		clk_2hz	=> CLK_2HZ
		);

u3 : cnt_10
	port map(
		CLK	=> CLK_2HZ,
		rst	=> FPGA_RST_TMP,
		q		=> Q_TMP
		);
		
u4 : seg_scan
	port map(
		CLK	=> CLK_2HZ,
		RST	=> FPGA_RST_TMP,
		DIGIT	=> DIGIT
		);
		
u5 : LED_8
	port map(
		Q		=> Q_TMP,
		LED	=> LED
		);

u6 : seg_7
	port map(
		Q		=> Q_TMP,
		SEG	=> SEG
		);

end Behavioral;