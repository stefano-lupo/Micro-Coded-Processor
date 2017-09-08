-------------------------------------------------------------------
-- 2 to  1 16 bit Multiplexer
--	Inputs	
--				in0		:	Option 0 - 16 bit vector
--				in1		: 	Option 1	- 16 bit vector
--				s			: 	Selector	- 1 bit
-- Outputs	
--				output	: Selected input 
-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2_16bit is
	Port(	in0,in1			: in std_logic_vector(15 downto 0);
			s 					: in std_logic;
			output 			: out std_logic_vector(15 downto 0)
			);
end mux2_16bit;

architecture Behavioral of mux2_16bit is
begin
   process ( s,in0,in1)
		begin
		case  s is
			when '0' => output <= in0 after 1 ns;
			when '1' => output <= in1 after 1 ns;
			when others => output <= "1010101010101010" after 1 ns;
		end case;
	end process;
end Behavioral;


