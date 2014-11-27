----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:20:58 03/04/2010 
-- Design Name: 
-- Module Name:    fifo_test_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo_test_top is
    Port ( clk100m : in  STD_LOGIC;
           rstb    : in  STD_LOGIC;
           push_sw : in  STD_LOGIC_VECTOR (1 downto 0);
           led     : out  STD_LOGIC_VECTOR (7 downto 0));
end fifo_test_top;

architecture Behavioral of fifo_test_top is

component fifo_256x4
	port (
	clk  : IN std_logic;
	rst  : IN std_logic;
	din  : IN std_logic_VECTOR(3 downto 0);
	wr_en: IN std_logic;
	rd_en: IN std_logic;
	dout : OUT std_logic_VECTOR(3 downto 0);
	full : OUT std_logic;
	empty: OUT std_logic);
end component;

signal tmp_cnt    : std_logic_vector(23 downto 0);
signal clk10hz    : std_logic;
signal fifo_din   : std_logic_vector(3 downto 0);
signal fifo_dout  : std_logic_vector(3 downto 0);
signal fifo_rst   : std_logic;
signal fifo_wren  : std_logic;
signal fifo_rden  : std_logic;
signal fifo_full  : std_logic;
signal fifo_empty : std_logic;

begin

fifo_rst   <= not rstb;
fifo_wren  <= not push_sw(0);
fifo_rden  <= not push_sw(1);
LED(4)     <= '0';
LED(5)     <= '0';
LED(6)     <= fifo_full;
LED(7)     <= fifo_empty;

process(fifo_rst, clk100m)
begin
	if fifo_rst = '1' then
		tmp_cnt <= (others => '0');
		clk10hz <= '0';
		elsif rising_edge(clk100m) then
			if tmp_cnt = X"4C4B40" then  -- for EDA-Lab II
			--if tmp_cnt = X"000003" then  -- for simulation
				tmp_cnt <= (others => '0');
				clk10hz <= not clk10hz;
				else
				tmp_cnt <= tmp_cnt + '1';
				clk10hz <= clk10hz;
			end if;
	end if;
end process;

process(fifo_rst, clk10hz)
begin
	if fifo_rst = '1' then
		fifo_din <= (others => '0');
		elsif rising_edge(clk10hz) then
			if fifo_wren = '1' then
				fifo_din <= fifo_din + '1';
			end if;
	end if;
end process;
				

fifo1 : fifo_256x4
		port map (
			clk   => clk10hz,
			rst   => fifo_rst,
			din   => fifo_din,
			wr_en => fifo_wren,
			rd_en => fifo_rden,
			dout  => fifo_dout,
			full  => fifo_full,
			empty => fifo_empty);

led(3 downto 0) <= fifo_din  when fifo_wren = '1' else
						 fifo_dout when fifo_rden = '1' else
						 (others => '0');
						 
end Behavioral;