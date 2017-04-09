------------------------------------------------------
-- 16 Bit, 1 Position Logic Shifter
-- Inputs : 
--				b 			: 	16 bit vector to shift
--				h_select	:	Encoding of shift direction
--								"00" - no shift
--								"01" - shift right
--								"10" - shift left
--	Outputs :
--				output	: Shifted 16 bit vector
-------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_16bit is
		Port(
			b 					: in std_logic_vector(15 downto 0);
			h_select			: in std_logic_vector(1 downto 0);
			output 			: out std_logic_vector(15 downto 0)
	);
end shifter_16bit;

architecture Behavioral of shifter_16bit is
	component unit_shifter_1bit
		Port(	
			shiftDir : in std_logic_vector(1 downto 0);
			bits 		: in std_logic_vector(2 downto 0);
			output 	: out std_logic
		);
		end component;
		
		-- Output 16 bits 
		signal shifted : std_logic_vector(15 downto 0);
		
		-- Least significant adjacent bits 
		signal lsShiftBits : std_logic_vector(2 downto 0);
		
		-- Most significant adjacent bits
		signal msShiftBits : std_logic_vector(2 downto 0);
		
		
begin
	
	-- Least significant bit shift options : b(1), b(0) or 0
	lsShiftBits <= b(1 downto 0) & '0';
	
	-- Most signifcant bit shift options 	: 0, b(15) or b(14)
	msShiftBits <= '0' & b(15 downto 14);

	-- instantiate unit shifter 0
	us0: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => lsShiftBits,
		output => shifted(0)
	);
	
		-- instantiate unit shifter 0
	us1: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(2 downto 0),
		output => shifted(1)
	);
	
		-- instantiate unit shifter 0
	us2: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(3 downto 1),
		output => shifted(2)
	);
	
		-- instantiate unit shifter 0
	us3: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(4 downto 2),
		output => shifted(3)
	);
	
		-- instantiate unit shifter 0
	us4: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(5 downto 3),
		output => shifted(4)
	);
	
		-- instantiate unit shifter 0
	us5: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(6 downto 4),
		output => shifted(5)
	);
	
		-- instantiate unit shifter 0
	us6: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(7 downto 5),
		output => shifted(6)
	);
	
		-- instantiate unit shifter 0
	us7: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(8 downto 6),
		output => shifted(7)
	);
	
		-- instantiate unit shifter 0
	us8: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(9 downto 7),
		output => shifted(8)
	);
	
		-- instantiate unit shifter 0
	us9: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(10 downto 8),
		output => shifted(9)
	);
	
		-- instantiate unit shifter 0
	us10: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(11 downto 9),
		output => shifted(10)
	);
	
		-- instantiate unit shifter 0
	us11: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(12 downto 10),
		output => shifted(11)
	);
	
		-- instantiate unit shifter 0
	us12: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(13 downto 11),
		output => shifted(12)
	);
	
		-- instantiate unit shifter 0
	us13: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(14 downto 12),
		output => shifted(13)
	);
	
		-- instantiate unit shifter 0
	us14: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits => b(15 downto 13),
		output => shifted(14)
	);
	
		-- instantiate unit shifter 0
	us15: unit_shifter_1bit port map(
		shiftDir => h_select,
		bits =>  msShiftBits,
		output => shifted(15)
	);
	
	-- Connect output to internal signal
	output <= shifted;

end Behavioral;

