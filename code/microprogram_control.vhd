
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity microprogram_control is
	port(
		clock 			: in std_logic;
		
		-- input to IR
		instructionIn 	: in std_logic_vector(15 downto 0);
		
		-- Input to Branch Unit
		n					: in std_logic;
		z					: in std_logic;
		c					: in std_logic;
		v					: in std_logic;
		
		-- PC outputs
		pcNextAddr		: out std_logic_vector(15 downto 0);
		
		-- IR outputs (concat with temp bits)
		destReg			: out std_logic_vector(3 downto 0);
		sourceAReg		: out std_logic_vector(3 downto 0);
		sourceBReg		: out std_logic_vector(3 downto 0);
		
		sourceBImmediate: out std_logic_vector(15 downto 0);
		
		-- Control Memory outputs
		mb					: out std_logic;
		fsOut				: out std_logic_vector(4 downto 0);
		md					: out std_logic;
		regFileRW		: out std_logic;
		mm					: out std_logic;
		mw					: out std_logic
	);
	
end microprogram_control;

architecture Behavioral of microprogram_control is

	-- Declare Program Counter
	component program_counter
	port(
		offset	: in std_logic_vector(5 downto 0);
		pl			: in std_logic;
		pi 		: in std_logic;
		clock		: in std_logic;
		toMemory : out std_logic_vector(15 downto 0)
	);
	end component;

	-- Declare branch unit
	component branch_unit
	Port(
		n : in std_logic;
		z : in std_logic;
		c : in std_logic;
		v : in std_logic;
		ms: in std_logic_vector(2 downto 0);
		output : out std_logic
	);
	end component;
	
	
	-- Declare instruction register
	component instruction_register
	Port(	input				: in std_logic_vector(15 downto 0);
			IL					: in std_logic;
			clock				: in std_logic;
			opCode			: out std_logic_vector(7 downto 0);
			destReg			: out std_logic_vector(2 downto 0);
			sourceRegA		: out std_logic_vector(2 downto 0);
			sourceRegB		: out std_logic_vector(2 downto 0)
	);
	end component;
	
	
	-- Declare 2 input 8bit multiplexer
	component mux2_8bit
			Port(	in0,in1	: in std_logic_vector(7 downto 0);
			s 					: in std_logic;
			output 			: out std_logic_vector(7 downto 0)
	);
	end component;
	
	
	-- Declare Control Address Register
	component control_address_register
	Port(
		clock : in std_logic;
		load : in std_logic;
		address : in std_logic_vector(7 downto 0);
		output : out std_logic_vector(7 downto 0)
	);
	end component;
	
	-- Declare Control Memory
	component control_memory_256_28bit
		Port(
			CAR: in std_logic_vector(7 downto 0); -- Address to select
			MW: out std_logic; -- to main memory 
			MM: out std_logic; -- Main mem address from PC or datapath
			RW: out std_logic; -- Into register file
			MD: out std_logic; -- Select between output of FU or memoy
			FS: out std_logic_vector(4 downto 0);
			MB: out std_logic; -- Feed functional unit with Reg B or constant from opcode
			TB: out std_logic; -- temp b flag
			TA: out std_logic; -- temp a flag
			TD: out std_logic; -- temp dest flag
			PL: out std_logic; -- something with PC
			PI: out std_logic; -- something with PC
			IL: out std_logic; -- Inst Reg latch signal
			MC: out std_logic; -- Car take next address or opcode 
			MS: out std_logic_vector(2 downto 0); -- Picks conditional branch
			NA: out std_logic_vector(7 downto 0)  -- Next Address
		);
	end component;

	
	-- IR internal signals
	signal ir_dr, ir_sa, ir_sb : std_logic_vector(2 downto 0);
	signal ir_opcode : std_logic_vector(7 downto 0);
	
	
	-- PC internal signals
	signal pc_offset : std_logic_vector(5 downto 0);

	
	-- Branch Unit internal signals
	signal bu_enable : std_logic;
	
	
	-- MuxC internal signals
	signal muxC_output : std_logic_vector(7 downto 0);
	
	
	-- CAR internal signals
	signal car_output : std_logic_vector(7 downto 0) := "00000000";
	
	
	-- Contorl Memory internal signals
	signal	cmem_CAR: std_logic_vector(7 downto 0) := car_output;
	signal	cmem_MW: std_logic; -- to main memory 
	signal	cmem_MM: std_logic; -- Main mem address from PC or datapath
	signal	cmem_RW: std_logic; -- Into register file
	signal 	cmem_MD: std_logic; -- Select between output of FU or memoy
	signal	cmem_FS: std_logic_vector(4 downto 0);
	signal	cmem_MB: std_logic; -- Feed functional unit with Reg B or constant from opcode
	signal	cmem_TB: std_logic; -- temp b flag
	signal	cmem_TA: std_logic; -- temp a flag
	signal	cmem_TD: std_logic; -- temp dest flag
	signal	cmem_PL: std_logic; -- something with PC
	signal	cmem_PI: std_logic; -- something with PC
	signal	cmem_IL: std_logic; -- Inst Reg latch signal
	signal	cmem_MC: std_logic; -- Car take next address or opcode 
	signal	cmem_MS: std_logic_vector(2 downto 0); -- Picks conditional branch
	signal	cmem_NA: std_logic_vector(7 downto 0);  -- Next Address




begin
	pc_offset <= ir_dr & ir_sb;

	-- Program Counter
	pc: program_counter port map(
		offset => pc_offset,
		pl => cmem_PL,
		pi => cmem_PI,
		clock => clock,
		toMemory => pcNextAddr
	);
	
	
	-- Branch Unit
	bu: branch_unit port map(
		n => n,
		z => z,
		c => c,
		v => v,
		ms => cmem_MS,
		output => bu_enable
	);
	

	-- Instruction Register
	ir: instruction_register port map(
		input => instructionIn,
		IL => cmem_IL,
		clock => clock,
		opCode => ir_opcode,
		destReg => ir_dr,
		sourceRegA => ir_sa,
		sourceRegB => ir_sb
	);
	
	-- Mux C
	muxC: mux2_8bit port map(
		in0 => cmem_NA,
		in1 => ir_opcode,
		s => cmem_MC,
		output => muxC_output
	);
	
	
	-- CAR
	car: control_address_register port map(
		clock => clock,
		load => bu_enable,
		address => muxC_output,
		output => car_output
	);
	
	
	-- Control Memory
	cm: control_memory_256_28bit port map(
		CAR => car_output,
		MW => cmem_MW,
		MM => cmem_MM,
		RW => cmem_RW,
		MD => cmem_MD,
		FS => cmem_FS,
		MB => cmem_MB,
		TB => cmem_TB,
		TA => cmem_TA,
		TD => cmem_TD,
		PL => cmem_PL,
		PI => cmem_PI,
		IL => cmem_IL,
		MC => cmem_MC,
		MS => cmem_MS,
		NA => cmem_NA
	);



	-- Write output signals
	destReg <= cmem_TD & ir_dr	;	-- NEED TO CHECK THIS	
	sourceAReg <= cmem_TA & ir_sa;
	sourceBReg <= cmem_TB & ir_sb;
	
	sourceBImmediate <= "0000000000000" & ir_sb;
	
	mb <= cmem_MB;
	fsOut <= cmem_FS;
	md <= cmem_MD;
	regFileRw <= cmem_RW;
	mm <= cmem_MM;
	mw <= cmem_MW;


end Behavioral;

