
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_processor is
	Port(
		clock : in std_logic
	);
end full_processor;

architecture Behavioral of full_processor is

	-- Declare Datapath
	component datapath_microcode
		Port(
			-- Register File
			a_select			: in std_logic_vector(3 downto 0);		
			b_select			: in std_logic_vector(3 downto 0);		
			dest_select		: in std_logic_vector(3 downto 0);
			rw					: in std_logic;
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
			memOut			: out std_logic_vector(15 downto 0);
			
			-- MuxM
			pcNextAddr		: in std_logic_vector(15 downto 0);
			mm					: in std_logic;
			
			-- Mux D
			md					: std_logic								
		);
	end component;
	
	
	-- Declare Control 
	component microprogram_control
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
	end component;
	
	
	
	-- Control Internal Signals
	signal c_pcNextAddr 	: std_logic_vector(15 downto 0);
	signal c_destReg		: std_logic_vector(3 downto 0);
	signal c_sourceAReg	: std_logic_vector(3 downto 0);
	signal c_sourceBReg	: std_logic_vector(3 downto 0);
	signal c_sourceBImmediate : std_logic_vector(15 downto 0);
	signal c_mb : std_logic;
	signal c_fsOut : std_logic_vector(4 downto 0);
	signal c_md : std_logic;
	signal c_regFileRW : std_logic;
	signal c_mm : std_logic;
	signal c_mw : std_logic;
	
	-- Datapath Internal Signals
	signal dp_v : std_logic;
	signal dp_c : std_logic;
	signal dp_n : std_logic;
	signal dp_z : std_logic;
	signal dp_memOut : std_logic_vector(15 downto 0);
	
begin

	-- Datapath
	dp: datapath_microcode port map(
		a_select => c_sourceAReg,
		b_select => c_sourceBReg,
		dest_select => c_destReg,
		rw => c_regFileRw,
		clk  => clock,
		const_in => c_sourceBImmediate,
		mb => c_mb,
		fs_control => c_fsOut,
		v => dp_v,
		c => dp_c,
		n => dp_n,
		z => dp_z,
		mw => c_mw,
		memOut => dp_memOut,
		pcNextAddr => c_pcNextAddr,
		mm => c_mm,
		md => c_md
	);



	control: microprogram_control port map (
		clock => clock,
		instructionIn => dp_memOut,
		n => dp_n,
		z => dp_z,
		c => dp_c,
		v => dp_v,
		pcNextAddr => c_pcNextAddr,
		destReg => c_destReg,
		sourceAReg => c_sourceAReg,
		sourceBReg => c_sourceBReg,
		SourceBImmediate => c_sourceBImmediate,
		mb => c_mb,
		fsOut => c_fsOut,
		md => c_md,
		regFileRW => c_regFileRW,
		mm => c_mm,
		mw => c_mw
	);
	

end Behavioral;

