----------------------------------------------------------------------------
-- 1 bit Logic Unit 	- capable of and, or, xor , not
-- 						- uses standard 2 selector 16bit multiplexer
-- Inputs: 
--				a			: 	Bit one
--				b			: 	Bit two
--				s			: 	Encoding of logical operation
--								"00" - AND
--								"01" - OR
--								"10" - XOR
--								"11" - NOT
-- Outputs:	
--				output	: 	The result of the logical operation
---------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity logic_unit_1bit is
	Port(	a : in std_logic;
			b : in std_logic;
			s : in std_logic_vector(1 downto 0);
			output : out std_logic
	);
end logic_unit_1bit;

architecture Behavioral of logic_unit_1bit is

	-- Declare 4 to 1 1bit multiplexer
	component mux2_1bit
		Port(	a : in std_logic;
				b : in std_logic;
				c : in std_logic;
				d : in std_logic;
				s : in std_logic_vector(1 downto 0);
				output : out std_logic
		);
	end component;
	
	
	--internal signals
	signal muxOut : std_logic;
	signal anded : std_logic;
	signal ored : std_logic;
	signal xored : std_logic;
	signal noted : std_logic;
	
begin
	
	-- Perform each of the logical operations
	anded <= a and b after 1 ns;
	ored <= a or b after 1 ns;
	xored <= a xor b after 1 ns;
	noted <= not a after 1 ns;
	
	-- Select desired operation based on encoding given
	mp: mux2_1bit port map(
		a => anded,
		b => ored,
		c => xored,
		d => noted,
		s => s,
		output => muxOut
	);
	
	-- Connect to the output
	output <= muxOut;
	
	
	

end Behavioral;

