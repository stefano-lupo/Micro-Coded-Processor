----------------------------------------------------------------------------
-- 16 Bit Logic Unit - capable of bitwise AND, OR, XOR, NOT
-- Inputs: 
--				a			: 	16 bit vector 
--				b			: 	16 bit vector
--				s			: 	Encoding of logical operation
--								"00" - AND
--								"01" - OR
--								"10" - XOR
--								"11" - NOT
-- Outputs:	
--				output	: 	The 16 bit result of the logical operation
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity logic_unit is
	Port(	a : in std_logic_vector(15 downto 0);
			b : in std_logic_vector(15 downto 0);
			s : in std_logic_vector(1 downto 0);
			output : out std_logic_vector(15 downto 0)
	);
end logic_unit;

architecture Behavioral of logic_unit is
	
	-- Declare 1bit logic unit
	component logic_unit_1bit
		Port(	a : in std_logic;
				b : in std_logic;
				s : in std_logic_vector(1 downto 0);
				output : out std_logic
		);
	end component;
	
	
	-- internal signals
	signal lu_output : std_logic_vector(15 downto 0);
	
begin

	-- Instantiate 16 1 bit logic units
	
	
	lu0: logic_unit_1bit port map(
		a => a(0),
		b => b(0),
		s => s,
		output => lu_output(0)
	);
	
	lu1: logic_unit_1bit port map(
		a => a(1),
		b => b(1),
		s => s,
		output => lu_output(1)
	);
	
	lu2: logic_unit_1bit port map(
		a => a(2),
		b => b(2),
		s => s,
		output => lu_output(2)
	);
	
	lu3: logic_unit_1bit port map(
		a => a(3),
		b => b(3),
		s => s,
		output => lu_output(3)
	);
	
	lu4: logic_unit_1bit port map(
		a => a(4),
		b => b(4),
		s => s,
		output => lu_output(4)
	);
	
	lu5: logic_unit_1bit port map(
		a => a(5),
		b => b(5),
		s => s,
		output => lu_output(5)
	);
	
	lu6: logic_unit_1bit port map(
		a => a(6),
		b => b(6),
		s => s,
		output => lu_output(6)
	);
	
	lu7: logic_unit_1bit port map(
		a => a(7),
		b => b(7),
		s => s,
		output => lu_output(7)
	);
	
	lu8: logic_unit_1bit port map(
		a => a(8),
		b => b(8),
		s => s,
		output => lu_output(8)
	);
	
	lu9: logic_unit_1bit port map(
		a => a(9),
		b => b(9),
		s => s,
		output => lu_output(9)
	);
	
	lu10: logic_unit_1bit port map(
		a => a(10),
		b => b(10),
		s => s,
		output => lu_output(10)
	);
	
	lu11: logic_unit_1bit port map(
		a => a(11),
		b => b(11),
		s => s,
		output => lu_output(11)
	);
	
	lu12: logic_unit_1bit port map(
		a => a(12),
		b => b(12),
		s => s,
		output => lu_output(12)
	);
	
	lu13: logic_unit_1bit port map(
		a => a(13),
		b => b(13),
		s => s,
		output => lu_output(13)
	);
	
	lu14: logic_unit_1bit port map(
		a => a(14),
		b => b(14),
		s => s,
		output => lu_output(14)
	);
	
	lu15: logic_unit_1bit port map(
		a => a(15),
		b => b(15),
		s => s,
		output => lu_output(15)
	);
	
	-- Map output to component output
	output <= lu_output;

end Behavioral;

