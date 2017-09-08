---------------------------------------------------------------------------
--	1 bit Full Adder Circuit
-- Inputs: 
--				x			: 	Operand one
--				y			: 	Operand two
--				cin		: 	Carry In
-- Outputs:	
--				s			: 	The sum of the two operands
--				cout		: 	The carry out associated with the operation
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder_1bit is
	Port(	x 		: in std_logic;
			y 		: in std_logic;
			cin 	: in std_logic;
			s	 	: out std_logic;
			cout 	: out std_logic
	);
end full_adder_1bit;

architecture Behavioral of full_adder_1bit is

	signal top : std_logic;

begin

	top <= x xor y after 1 ns;
	s <= top xor cin after 1 ns;
	
	cout <= ((x and y) or (top and cin)) after 1 ns;
end Behavioral;

