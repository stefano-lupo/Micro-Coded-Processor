---------------------------------------------------------------------------
--	16 bit Ripple Adder Circuit
-- Inputs: 
--				a			: 	16 bit vector - Operand one
--				b			: 	16 bit vector - Operand two
--				cin		: 	1 bit			  - Carry In
-- Outputs:	
--				output	: 	16 bit vector - The sum of the two operands
--				cout		: 	1 bit			  - The carry out associated with the operation
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ripple_adder_16bit is
	Port(	a 					: in std_logic_vector(15 downto 0);
			b 					: in std_logic_vector(15 downto 0);
			cin 				: in std_logic;
			output 			: out std_logic_vector(15 downto 0);
			c_second_last 	: out std_logic;
			cout 				: out std_logic
	);
end ripple_adder_16bit;

architecture Behavioral of ripple_adder_16bit is
	-- Declare 1 bit full adder
	component full_adder_1bit
		port(	x 		: in std_logic;
				y	 	: in std_logic;
				cin	: in std_logic;
				s 		: out std_logic;
				cout 	: out std_logic
			  );
	end component;
	
	
	-- declare internal signal to hold carries	
	signal carries	: std_logic_vector(15 downto 0);	

begin
	
	
	-- Assign initial lsb of carries vector as carry in to first Full Adder 
	carries(0) <= cin;
	
	-- instantiate FA 0
	fa0: full_adder_1bit port map(
		x => a(0),
		y => b(0),
		cin => carries(0),
		s => output(0),
		cout => carries(1)
	);
	
		-- instantiate FA 1
	fa1: full_adder_1bit port map(
		x => a(1),
		y => b(1),
		cin => carries(1),
		s => output(1),
		cout => carries(2)
	);
	
		-- instantiate FA 2
	fa2: full_adder_1bit port map(
		x => a(2),
		y => b(2),
		cin => carries(2),
		s => output(2),
		cout => carries(3)
	);
	
		-- instantiate FA 3
	fa3: full_adder_1bit port map(
		x => a(3),
		y => b(3),
		cin => carries(3),
		s => output(3),
		cout => carries(4)
	);
	
		-- instantiate FA 4
	fa4: full_adder_1bit port map(
		x => a(4),
		y => b(4),
		cin => carries(4),
		s => output(4),
		cout => carries(5)
	);
	
		-- instantiate FA 5
	fa5: full_adder_1bit port map(
		x => a(5),
		y => b(5),
		cin => carries(5),
		s => output(5),
		cout => carries(6)
	);
	
		-- instantiate FA 6
	fa6: full_adder_1bit port map(
		x => a(6),
		y => b(6),
		cin => carries(6),
		s => output(6),
		cout => carries(7)
	);
	
		-- instantiate FA 7
	fa7: full_adder_1bit port map(
		x => a(7),
		y => b(7),
		cin => carries(7),
		s => output(7),
		cout => carries(8)
	);
	
		-- instantiate FA 8
	fa8: full_adder_1bit port map(
		x => a(8),
		y => b(8),
		cin => carries(8),
		s => output(8),
		cout => carries(9)
	);
	
		-- instantiate FA 9
	fa9: full_adder_1bit port map(
		x => a(9),
		y => b(9),
		cin => carries(9),
		s => output(9),
		cout => carries(10)
	);
	
		-- instantiate FA 10
	fa10: full_adder_1bit port map(
		x => a(10),
		y => b(10),
		cin => carries(10),
		s => output(10),
		cout => carries(11)
	);
	
		-- instantiate FA 11
	fa11: full_adder_1bit port map(
		x => a(11),
		y => b(11),
		cin => carries(11),
		s => output(11),
		cout => carries(12)
	);
	
		-- instantiate FA 12
	fa12: full_adder_1bit port map(
		x => a(12),
		y => b(12),
		cin => carries(12),
		s => output(12),
		cout => carries(13)
	);
	
		-- instantiate FA 13
	fa13: full_adder_1bit port map(
		x => a(13),
		y => b(13),
		cin => carries(13),
		s => output(13),
		cout => carries(14)
	);
	
		-- instantiate FA 14
	fa14: full_adder_1bit port map(
		x => a(14),
		y => b(14),
		cin => carries(14),
		s => output(14),
		cout => carries(15)
	);
	
		-- instantiate FA 15
	fa15: full_adder_1bit port map(
		x => a(15),
		y => b(15),
		cin => carries(15),
		s => output(15),
		cout => cout
	);
	
	-- Map output to component output
	c_second_last <= carries(15);
	
end Behavioral;

