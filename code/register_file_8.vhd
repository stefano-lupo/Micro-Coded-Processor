------------------------------------------------------------------------------
--	Register file containing 8 16 bit registers
-- Inputs
--			a_selector	:	Encoding of A Register - 3 bit vector
--			b_selector	:	Encoding of B Register - 3 bit vector
--			des			:	Encoding of Destination Register - 3 bit vector
--			dataIn		:	Data to be latched by destination reg - 16 bit vector
--			writeSig		:	Allows register to latch or not latch data - 1 bit
--			clk			:	Clock signal 
--
--	Outputs
--			aOut			: Data contained in register A - 16 bit vector
--			bOut			: Data container in register B - 16 bit vector
--			
--	Note: Registers are also being output, just for clarity when debugging
--			so the waveforms can be clearly examined.
------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file_8 is
	Port(	
			-- Used for selecting a register on mux4		
			a_selector	: in std_logic_vector(2 downto 0);	
			
			-- Used for selecting b register on mux4		
			b_selector	: in std_logic_vector(2 downto 0);	
			
			-- Output Registers (to Functional Unit etc)		
			aOut			: out std_logic_vector(15 downto 0);
			bOut 			: out std_logic_vector(15 downto 0);
			
			-- Select destination register on decoder
			des 			: in std_logic_vector(2 downto 0);				
			
			-- Data from datapath
			dataIn		: in std_logic_vector(15 downto 0);
			
			-- Write signal
			writeSig		: in std_logic;
			
			-- Clock
			clk 			: in std_logic;								
			
			
			--temp: output registers
			reg0			: out std_logic_vector(15 downto 0);
			reg1			: out std_logic_vector(15 downto 0);
			reg2			: out std_logic_vector(15 downto 0);
			reg3			: out std_logic_vector(15 downto 0);
			reg4			: out std_logic_vector(15 downto 0);
			reg5			: out std_logic_vector(15 downto 0);
			reg6			: out std_logic_vector(15 downto 0);
			reg7			: out std_logic_vector(15 downto 0)
			);
end register_file_8;

architecture Behavioral of register_file_8 is

	-- Declare 16 bit register 
	component reg_16bit
		port(	input 	: in std_logic_vector(15 downto 0);
				load	 	: in std_logic;
				clk		: in std_logic;
				write_sig : in std_logic;
				output 	: out std_logic_vector(15 downto 0)
			  );
	end component;
	
	-- Declare 3 to 8 decoder
	component decoder_3to8
		port(	a			: in std_logic_vector(2 downto 0);
				q			: out std_logic_vector(7 downto 0)
		);
		end component;
	

	-- Declare 8 to 1 multiplexer : Used to select source regsiter
	component mux8_16bit
		port(
				in0 		: in std_logic_vector(15 downto 0);
				in1 		: in std_logic_vector(15 downto 0);
				in2 		: in std_logic_vector(15 downto 0);
				in3 		: in std_logic_vector(15 downto 0);
				in4 		: in std_logic_vector(15 downto 0);
				in5 		: in std_logic_vector(15 downto 0);
				in6 		: in std_logic_vector(15 downto 0);
				in7 		: in std_logic_vector(15 downto 0);
				s			: in std_logic_vector(2 downto 0);
				output 	: out std_logic_vector(15 downto 0)
			 );
	end component;
	
	
	-- Internal Signals
	
	-- Connects decoder outputs to register load inputs
	signal 	load		: std_logic_vector(7 downto 0);
	
	-- 16 bit outputs of each register		
	signal 	reg0_out, reg1_out, reg2_out, reg3_out,
				reg4_out, reg5_out, reg6_out, reg7_out		: std_logic_vector(15 downto 0);		


	-- output of a selecting multiplexer		
	signal 	selected_a_register								: std_logic_vector(15 downto 0);			

	-- output of b selecting multiplexer		
	signal 	selected_b_register								: std_logic_vector(15 downto 0);		
		
begin



	-- register r0
	reg00: reg_16bit port map(
		input => dataIn,
		load => load(0),
		clk => clk,
		write_sig => writeSig,
		output => reg0_out
	);

	-- register r1
	reg01: reg_16bit port map(
		input => dataIn,
		load => load(1),
		clk => clk,
		write_sig => writeSig,
		output => reg1_out
	);
	
	-- register r2
	reg02: reg_16bit port map(
		input => dataIn,
		load => load(2),
		clk => clk,
		write_sig => writeSig,
		output => reg2_out
	);
	
	-- register r3
	reg03: reg_16bit port map(
		input => dataIn,
		load => load(3),
		clk => clk,
		write_sig => writeSig,
		output => reg3_out
	);
	
	-- register r4
	reg04: reg_16bit port map(
		input => dataIn,
		load => load(4),
		clk => clk,
		write_sig => writeSig,
		output => reg4_out
	);

	-- register r5
	reg05: reg_16bit port map(
		input => dataIn,
		load => load(5),
		clk => clk,
		write_sig => writeSig,
		output => reg5_out
	);
	
	-- register r6
	reg06: reg_16bit port map(
		input => dataIn,
		load => load(6),
		clk => clk,
		write_sig => writeSig,
		output => reg6_out
	);
	
	-- register r7
	reg07: reg_16bit port map(
		input => dataIn,
		load => load(7),
		clk => clk,
		write_sig => writeSig,
		output => reg7_out
	);
	
	-- A multiplexer - Selects Register A
	aMux: mux8_16bit port map(
		in0 => reg0_out,
		in1 => reg1_out,
		in2 => reg2_out,
		in3 => reg3_out,
		in4 => reg4_out,
		in5 => reg5_out,
		in6 => reg6_out,
		in7 => reg7_out,
		s => a_selector,
		output => selected_a_register
	);
	
	-- B multiplexer - Selects Register B
	bMux: mux8_16bit port map(
		in0 => reg0_out,
		in1 => reg1_out,
		in2 => reg2_out,
		in3 => reg3_out,
		in4 => reg4_out,
		in5 => reg5_out,
		in6 => reg6_out,
		in7 => reg7_out,
		s => b_selector,
		output => selected_b_register
	);
	
	-- Decoder - Selects which register should latch incoming data
	decoder: decoder_3to8 port map(
		a => des,
		q => load			
	);
	
	-- Assign outputs of register file (to go to Function/Logic unit)
	aOut <= selected_a_register;
	bOut <= selected_b_register;
	
	reg0 <= reg0_out;
	reg1 <= reg1_out;
	reg2 <= reg2_out;
	reg3 <= reg3_out;
	reg4 <= reg4_out;
	reg5 <= reg5_out;
	reg6 <= reg6_out;
	reg7 <= reg7_out;
	
end Behavioral;

