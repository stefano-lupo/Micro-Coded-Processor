--------------------------------------------------------------------------------
--		Full 16 bit Datapath - Links the 8 16 bit registers in register file 
-- 							  	  to the functional unit.	
--
--		Register file signals
--		----------------------------------------------------------------------
--		a_select		: Input  - to multiplexer to select a register	-	3 bits
--		b_select		: Input  - to multiplexer to select b register	-	3 bits
--		dest_select	: Input  - to multiplexer selecting dest reg		-	3 bits
--
--		Multiplexer B signals
--		----------------------------------------------------------------------
--		const_in		: Input  - const value instead of reg b			- 	16 bits
--		b_source		: Input  - Mux B (Select constant in or Reg B) 	- 	1 bit
--
--		Functional Unit signals
--		----------------------------------------------------------------------
--		fs_control	: Input  - Operation selector from contro word	-	5 bits
--		v				: Output - Overflow Flag								-  1 bit
--		c				: Output - Carry Flag									- 	1 bit
--		n				: Output - Negative Flag								- 	1 bit
--		z				: Output - Zero Flag										-	1 bit
--
--		Memory I/O signals
--		----------------------------------------------------------------------
--		addr_out		: Output	- Pointer to Address in memory			-	16 bits
--		data_out		: Outpt	- Data to be written to memory			-	16 bits
--		data_in		: Input	- Data read in from memory					- 	16 bits
--
--		Multiplexer D signals
--		----------------------------------------------------------------------
--		mem_load		: Input	- Selects to take input from memory 
--										  or the functional unit				-	1 bit
--------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity datapath_microcode is
	Port(
			-- Register File
			a_select			: in std_logic_vector(3 downto 0);		
			b_select			: in std_logic_vector(3 downto 0);		
			dest_select		: in std_logic_vector(3 downto 0);
			rw		: in std_logic;
			clk				: in std_logic;
			
			-- Mux B
			const_in			: in std_logic_vector(15 downto 0);		
			mb					: in std_logic;							
			
			
			-- Functional Unit
			fs_control		: in std_logic_vector(4 downto 0);	
			v					: out std_logic;
			c					: out std_logic;
			n					: out std_logic;
			z					: out std_logic;
			
			-- Memory
			mw					: in std_logic;
			memOut			: out std_logic_vector(15 downto 0);	-- Goes to IR but not always latched
			
			-- MuxM
			pcNextAddr		: in std_logic_vector(15 downto 0);
			mm					: in std_logic;
			
			-- Mux D
			md					: in std_logic						
			
			
	);
	
end datapath_microcode;

architecture Behavioral of datapath_microcode is

	-- Declare Register File
	component register_file_9_16bit
		Port(		
			a_selector	: in std_logic_vector(3 downto 0);			
			b_selector	: in std_logic_vector(3 downto 0);	
				
			aOut			: out std_logic_vector(15 downto 0);
			bOut 			: out std_logic_vector(15 downto 0);
			
			des 			: in std_logic_vector(3 downto 0);				
			
			dataIn		: in std_logic_vector(15 downto 0);
			
			rw				: in std_logic;
			clk 			: in std_logic
			);
	end component;
	
	-- Declare Functional Unit
	component functional_unit
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
	end component;
	
	-- Declare 2 to 1 mux 16 bit
	component mux2_16bit
		Port(	in0,in1			: in std_logic_vector(15 downto 0);
			s 						: in std_logic;
			output 				: out std_logic_vector(15 downto 0)
		);
	end component;
	
	-- Declare Main memory
	component main_memory_512_16bit
	Port(	address			: in std_logic_vector(15 downto 0);
			writeData	 	: in std_logic_vector(15 downto 0);
			mw					: in std_logic;
			readData			: out std_logic_vector(15 downto 0)	-- To Instruction Register
	);
	end  component;
	
	
	-- Internal Signals for register file
	signal regFile_aOut 		: std_logic_vector(15 downto 0);
	signal regFile_bOut 		: std_logic_vector(15 downto 0);
	signal regFile_data_in : std_logic_vector(15 downto 0);
	
	signal regFile_dataOut	: std_logic_vector(15 downto 0);
	signal regFile_addrOut	: std_logic_vector(15 downto 0);
	
	
	-- Internal Signals for Functional Unit and Memory
	signal b_bus				: std_logic_vector(15 downto 0);
	signal fu_output 			: std_logic_vector(15 downto 0);
	signal data_from_memory : std_logic_vector(15 downto 0);
	signal muxMOut				: std_logic_vector(15 downto 0);
	
	
begin

	

	-- Instantiate register file
	regFile: register_file_9_16bit port map(
		a_selector => a_select,
		b_selector => b_select,
		aOut => regFile_aOut,
		bOut => regFile_bOut,
		des => dest_select,
		dataIn => regFile_data_in,
		rw => rw,
		clk => clk
	);
	
	
	-- Instantiate Functional Unit
	fu	: functional_unit port map(
		a => regFile_aOut,
		b => b_bus,
		fs_control => fs_control,
		clock => clk,
		output => fu_output,
		v => v,
		c => c,
		n => n,
		z => z
	);
	
	
	-- Selects between B register and constant input
	muxB: mux2_16bit port map(
		in0 => regFile_bOut,
		in1 => const_in,
		s => mb,
		output => b_bus
	);
	
	-- Selects between output of functional unit and data in
	muxD: mux2_16bit port map(
		in0 => fu_output,
		in1 => data_from_memory,
		s => md,
		output => regFile_data_in
	);
	
	-- Selects between bus b and pc for memory loading
	muxM: mux2_16bit port map(
		in0 => regFile_aOut,
		in1 => pcNextaddr,
		s => mm,
		output => muxMOut
	);
	
	-- Main memory module
	memory: main_memory_512_16bit port map(
		address => muxMOut,
		writeData => b_bus,
		mw	=> mw,
		readData => data_from_memory
	);
	
	memOut <= data_from_memory;
	
end Behavioral;

