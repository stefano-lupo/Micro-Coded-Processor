library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decoder_4to9 is
	Port( a 	: in std_logic_vector(3 downto 0);
			q : out std_logic_vector(8 downto 0)
		  );
end decoder_4to9;

architecture Behavioral of decoder_4to9 is

begin

	with a select 
			q  <= "000000001" after 1 ns when "0000" ,
					"000000010" after 1 ns when "0001",
					"000000100" after 1 ns when "0010",
					"000001000" after 1 ns when "0011",
					"000010000" after 1 ns when "0100",
					"000100000" after 1 ns when "0101",
					"001000000" after 1 ns when "0110",
					"010000000" after 1 ns when "0111",

					-- Anything with MSB set, use R8
					"100000000" when others;
end Behavioral;

