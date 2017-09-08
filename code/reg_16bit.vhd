------------------------------------------------------------------------------
--	16 bit register
-- Inputs
--			input			:	Data that can be latched - 16 bit vector
--			write_sg		:	Allows register to latch or not latch data - 1 bit
--			clk			:	Clock signal 
--			load			:	Register will only latch its input data if it is 
--								the destination register (set by decoder)
--
--	Outputs
--			output		: Data contained in register - 16 bit vector
------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity reg_16bit is
	port(	input : in std_logic_vector(15 downto 0);
			load, clk, write_sig : in std_logic;
			output : out std_logic_vector(15 downto 0)
		  );
end reg_16bit;

architecture Behavioral of reg_16bit is
begin
	process(clk)
		begin
		-- on seing rising edge of clock : if load and write are set, latch data from input onto output
			if(rising_edge(clk)) then
				if load = '1' and write_sig = '1' then
					output <= input after 1 ns;
				end if;
			end if;
	end process;
end Behavioral;

