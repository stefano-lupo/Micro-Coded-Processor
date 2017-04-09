------------------------------------------------------------------------------
--	16 bit Arithmetic and Logic Unit
--	Capable of performing arithmetic and logic operations as described in 
--	the arithmetic unit and logic units respectively
--
-- Inputs
--			a				: 	Operand A 								- 16 bit vector
--			b				:	Operand B 								- 16 bit vector
--			control		:  Subset of FS that ALU requires 	- 4 bit vector
--
--	Outputs
--			output				: Result of specified operation		- 16 bit vector
--			cout					: The carry out of the operation		- 1 bit
--			cout_second_last	: The carry out of the second last
--							  		  stage of the ripple adder. This
--									  is required by functional unit 
--									  to evaluate status flags
------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu is
	Port(	a 						: in std_logic_vector(15 downto 0);
			b 						: in std_logic_vector(15 downto 0);
			control 				: in std_logic_vector(3 downto 0);
			output 				: out std_logic_vector(15 downto 0);
			cout					: out std_logic;
			cout_second_last 	: out std_logic
	);
end alu;

architecture Behavioral of alu is

-- Declare logic unit
	component logic_unit
		Port(	a : in std_logic_vector(15 downto 0);
				b : in std_logic_vector(15 downto 0);
				s : in std_logic_vector(1 downto 0);
				output : out std_logic_vector(15 downto 0)
		);
	end component;
	
	-- Declare arithmetic unit
	component arithmetic_unit
		Port(	a 				: in std_logic_vector(15 downto 0);
				b 				: in std_logic_vector(15 downto 0);
				cin 			: in std_logic;
				op_select 	: in std_logic_vector(1 downto 0);
				output		: out std_logic_vector(15 downto 0);
				cout 			: out std_logic;
				cout_second_last : out std_logic
		);
	end component;
	
	-- Declare 2 to 1 mux 16 bit
	component mux2_16bit
		Port(	in0,in1			: in std_logic_vector(15 downto 0);
			s 						: in std_logic;
			output 				: out std_logic_vector(15 downto 0)
		);
	end component;
	
	
	-- internal signals
	signal opPicker 	: std_logic_vector(1 downto 0);
	signal carryIn		: std_logic;
	signal modeSel		: std_logic;
	
	signal luOut 		: std_logic_vector(15 downto 0);
	signal auOut 		: std_logic_vector(15 downto 0);
	signal auCarryOut : std_logic;
	signal auSecondLastCarryOut : std_logic;
	signal muxOut		: std_logic_vector(15 downto 0);
	
begin
	-- extract relevant control signals
	opPicker <= control(2 downto 1);
	carryIn <= control(0);
	modeSel <= control(3);
	
	-- Instantiate LU
	lu: logic_unit port map(
			a => a,
			b => b,
			s => opPicker,
			output => luOut
		);
		
	-- Instantate AU
	au: arithmetic_unit port map(
			a => a,
			b => b,
			cin => carryIn,
			op_select => opPicker,
			output => auOut,
			cout => auCarryOut,
			cout_second_last => auSecondLastCarryOut
		);
		
	-- Use multiplexer to select between the output
	--	of the arithmetic / logic unit
	mp: mux2_16bit port map(
			in0 => auOut,
			in1 => luOut,
			s => modeSel,
			output => muxOut
	);
		

	-- Map outputs
	output <= muxOut;
	cout <= auCarryOut;
	cout_second_last <= auSecondLastCarryOut;

end Behavioral;

