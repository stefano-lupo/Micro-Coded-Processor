-------------------------------------------------------------------
-- 2 to  1 8 bit Multiplexer
--	Inputs	
--				in0		:	Option 0 - 8 bit vector
--				in1		: 	Option 1	- 8 bit vector
--				s			: 	Selector	- 1 bit
-- Outputs	
--				output	: Selected input 
-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2_8bit is
	Port(	in0,in1			: in std_logic_vector(7 downto 0);
			s 					: in std_logic;
			output 			: out std_logic_vector(7 downto 0)
			);
end mux2_8bit;

architecture Behavioral of mux2_8bit is
begin
   process (s,in0,in1)
		begin
		case  s is
			when '0' => output <= in0 after 0 ns;
			when '1' => output <= in1 after 0 ns;
			when others => output <= "10101010" after 0 ns;
		end case;
	end process;
end Behavioral;


