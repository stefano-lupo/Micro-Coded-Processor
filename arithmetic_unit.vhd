----------------------------------------------------------------------------------
--	17 bit Arithmetic Unit - Capable of following operands
--	Y = A, Y = A+1, Y = A+B, Y + A+B+1, Y = A + not(B), Y = A-B, Y = A-1
-- Inputs: 
--				a				: 	16 bit vector 	- Operand one
--				b				: 	16 bit vector 	- Operand two
--				cin			: 	1 bit				- Carry In
--				op_select	: 	Encoding of 2 bits representing operation
--									"00" 	: Y = A
--									"01"	: Y = A + B
--									"10"	: Y = A + not(B)
--									"11"	: Y = A - 1
--									NOTE	: By setting carry in, one will be added to each
--											  of the above operations, changing their meaning
-- Outputs:	
--				output				: 	The result of the operation
--				cout					: 	The carry out associated with the operation
--				cout_second_last	:  The carry out of the second last full adder
--											(required by functional unit to calculate the
--										 	 overflow flag)
-----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity arithmetic_unit is
	Port(	a 						: in std_logic_vector(15 downto 0);
			b 						: in std_logic_vector(15 downto 0);
			cin 					: in std_logic;
			op_select 			: in std_logic_vector(1 downto 0);
			output				: out std_logic_vector(15 downto 0);
			cout 					: out std_logic;
			cout_second_last	: out std_logic
	);
end arithmetic_unit;

architecture Behavioral of arithmetic_unit is

	-- Declare 16 bit ripple adder
	component ripple_adder_16bit
	Port(	a 					: in std_logic_vector(15 downto 0);
			b 					: in std_logic_vector(15 downto 0);
			cin 				: in std_logic;
			output			: out std_logic_vector(15 downto 0);
			c_second_last 	: out std_logic;
			cout 				: out std_logic
	);
	end component;
	
	
	-- internal signals
	signal y 						: std_logic_vector(15 downto 0);
	signal ra_output				: std_logic_vector(15 downto 0);
	signal ra_c_second_last 	: std_logic;
	signal ra_cout					: std_logic;

	
begin

	-- y is an adjusted version of b, based on op_select
	with op_select select
		y <= 	"0000000000000000" after 1 ns when "00",
				b after 1 ns when "01",
				not(b) after 1 ns when "10",
				"1111111111111111" after 1 ns when "11",
				"1111111100000000" after 1 ns when others;
		
	-- 16bit ripple adder
	-- adjusted y is used on b port of 16bit ripple adder
	ra: ripple_adder_16bit port map(
		a => a,
		b => y,
		cin => cin,
		output => ra_output,
		c_second_last => ra_c_second_last,
		cout => ra_cout
	);
	
	-- Map outputs
	output <= ra_output;
	cout <= ra_cout;
	cout_second_last <= ra_c_second_last;
	
end Behavioral;

