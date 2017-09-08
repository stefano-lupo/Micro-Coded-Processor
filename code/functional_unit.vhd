----------------------------------------------------------------------------------
--	16 bit Functional Unit - Capable of operations on two 16 bit vectors 
--									 as described below
--
-- Inputs
--			a				: 	Operand A 	- 16 bit vector
--			b				:	Operand B 	- 16 bit vector
--			fs_control	:	Encoding of operation to perform - 5 bit vector
--									Arithmetic Operations
--									-------------------------
--									"00000"	:	 	A
--									"00001"	:	 	A + 1
--									"00010"	:		A + B
--									"00011"	:		A + B + 1
--									"00100"	:		A + not(B)
--									"00101"	:		A - B
--									"00110"	:		A - 1
--									"00111"	:		A
--									
--									Logical Operations
--									-------------------------
--									"01000"	:		A and B
--									"01010"	:		A or B
--									"01100"	:		A xor B
--									"01110"	:		not(A)
--	
--									Shifting Operations	
--									-------------------------							
--									"10000"	:		B
--									"10100"	:		lsr(B)
--									"11000"	:		lsl(B)

--			Clock			: 	Clock Signal
--	
--	Outputs
--			output		: 	Result of selected operation - 16 bit bector
--			v				: 	Overflow Flag
--			c				: 	Carry Out Flag
--			n				: 	Negative Flag
--			z				: 	Zero Flag
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity functional_unit is
	Port(
			a					: in std_logic_vector(15 downto 0);
			b 					: in std_logic_vector(15 downto 0);
			fs_control		: in std_logic_vector(4 downto 0);
			clock				: in std_logic;
			output 			: out std_logic_vector(15 downto 0);
			v					: out std_logic;
			c					: out std_logic;
			n					: out std_logic;
			z					: out std_logic
	);
end functional_unit;

architecture Behavioral of functional_unit is
	
	-- Declare 16 bit shifter
	component shifter_16bit
		Port(
				b 					: in std_logic_vector(15 downto 0);
				h_select			: in std_logic_vector(1 downto 0);
				output 			: out std_logic_vector(15 downto 0)
		);
	end component;
	
	-- Declare 16 bit ALU
	component alu
		Port(	a : in std_logic_vector(15 downto 0);
				b : in std_logic_vector(15 downto 0);
				control : in std_logic_vector(3 downto 0);
				output : out std_logic_vector(15 downto 0);
				cout		: out std_logic;
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
	signal mf 	: std_logic;
	signal g 	: std_logic_vector(3 downto 0);
	signal h		: std_logic_vector(1 downto 0);
	
	signal shifter_output 			: std_logic_vector(15 downto 0);
	signal alu_output 				: std_logic_vector(15 downto 0);
	signal alu_cout 					: std_logic;
	signal alu_second_last_cout 	: std_logic;
	signal mux_out						: std_logic_vector(15 downto 0);
	
begin
	
	-- internal signal as inputs
	mf <= fs_control(4);
	g <= fs_control(3 downto 0);
	h <= fs_control(3 downto 2);

	
	
	-- Initialize shifter
	shifter: shifter_16bit port map(
		b => b,
		h_select => h,
		output => shifter_output
	);
	
	-- Initialize alu
	m_alu: alu port map(
		a => a,
		b => b,
		control => g,
		output => alu_output,
		cout => alu_cout,
		cout_second_last => alu_second_last_cout
	);
	
	mp: mux2_16bit port map(
			in0 => alu_output,
			in1 => shifter_output,
			s => mf,
			output => mux_out
	);
	
	
	process(clock)
		begin
		if(rising_edge(clock)) then
			-- CPSR
				n <= mux_out(15) after 1 ns;
				
				if(mux_out = "0000000000000000") then
					z <= '1' after 1 ns;
				else 
					z <= '0' after 1 ns;
				end if;
					
				
				
				c <= alu_cout after 1 ns;
	
				v <= alu_cout xor alu_second_last_cout after 1 ns;

			end if;
	end process;
		
		--with mux_out select 
			--		z <= 	'1' after 1 ns when "0000000000000000",
			--				'0' after 1 ns when others;
				
	
	
	
	output <= mux_out;

end Behavioral;

