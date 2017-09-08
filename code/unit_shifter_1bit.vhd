----------------------------------------------------------------------------
-- 1 bit, 1 position logic shifter
-- Inputs: 
--				shiftDir : 	Direction to shift
--								"00" - no shift
--								"01" - shift right
--								"10" - shift left
--				bits		: 	Adjacent and current bit
--								"ABC" - bit to left, current bit, bit to right
-- Outputs:	
--				output	: Bit to use in this position
---------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity unit_shifter_1bit is

	-- bits input as : (left mid right) : bits(2) bits(1) bits(0)
	Port(	shiftDir : in std_logic_vector(1 downto 0);
			bits 		: in std_logic_vector(2 downto 0);
			output 	: out std_logic
	);

end unit_shifter_1bit;

architecture Behavioral of unit_shifter_1bit is

begin

	with shiftDir select 
		output <= 	bits(1) after 1 ns when "00",		-- take middle bit					(no change)
						bits(2) after 1 ns when "01",		-- take in bit on its left			(shift right)
						bits(0) after 1 ns when "10",		-- take in bit on its right		(shift left)
						bits(1) after 1 ns when others;

end Behavioral;

