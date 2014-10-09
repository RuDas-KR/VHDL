----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HalfAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carrier : out  STD_LOGIC);
end HalfAdder;

architecture Behavioral of HalfAdder is

begin

	sum <= A xor B;
	carrier <= A and B;

end Behavioral;

