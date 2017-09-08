----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:04 02/17/2017 
-- Design Name: 
-- Module Name:    register_file_16 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- this is current register file 4
entity register_file_4 is
	Port(	src 		: in std_logic_vector(1 downto 0);				-- used for selecting source register on mux4				
			des 		: in std_logic_vector(1 downto 0);				-- select destination register on decoder
			clk 		: in std_logic;										-- clock
			data_src : in std_logic;										-- select between data out of register/memory (mux2)
			data 		: in std_logic_vector(15 downto 0);				-- Data from memory
			reg0		: out std_logic_vector(15 downto 0);
			reg1		: out std_logic_vector(15 downto 0);			
			reg2 		: out std_logic_vector(15 downto 0);
			reg3 		: out std_logic_vector(15 downto 0)
			);
end register_file_4;

architecture Behavioral of register_file_4 is

	-- Declare 16 bit register 
	component reg_16bit
		port(	input 	: in std_logic_vector(15 downto 0);
				load	 	: in std_logic;
				clk		: in std_logic;
				output 	: out std_logic_vector(15 downto 0)
			  );
	end component;
	
	-- Declare 2 to 4 decoder
	component decoder_2to4
		port(	a			: in std_logic_vector(1 downto 0);
				q0			: out std_logic;
				q1			: out std_logic;
				q2			: out std_logic;
				q3			: out std_logic
			  );
		end component;
	
	-- Declare 2 to 1 multiplexer : Used to select between writing result of mux below to destination or use data from memory
	component mux2_16bit
		port(
				in0 		: in std_logic_vector(15 downto 0);
				in1 		: in std_logic_vector(15 downto 0);
				s 			: in std_logic;
				output	: out std_logic_vector(15 downto 0)
			 );
		end component;
		
	-- Declare 4 to 1 multiplexer : Used to select source regsiter
	component mux4_16bit
		port(
				in0 		: in std_logic_vector(15 downto 0);
				in1 		: in std_logic_vector(15 downto 0);
				in2 		: in std_logic_vector(15 downto 0);
				in3 		: in std_logic_vector(15 downto 0);
				s			: in std_logic_vector(1 downto 0);
				output 	: out std_logic_vector(15 downto 0)
			 );
	end component;
	
	
	-- Internal Signals
	signal load_reg0, load_reg1, load_reg2, load_reg3 	: std_logic;									-- Connects decoder outputs to register load inputs
	signal reg0_out, reg1_out, reg2_out, reg3_out 		: std_logic_vector(15 downto 0);			-- 16 bit outputs of each register
	signal register_input	 									: std_logic_vector(15 downto 0);			-- output of memory/register mux selector
	signal selected_soruce_register							: std_logic_vector(15 downto 0);			-- output of source selecting multiplexer		
		
begin

	-- register r0
	reg00: reg_16bit port map(
		input => register_input,
		load => load_reg0,
		clk => clk,
		output => reg0_out
	);

	-- register r1
	reg01: reg_16bit port map(
		input => register_input,
		load => load_reg1,
		clk => clk,
		output => reg1_out
	);
	
	-- register r2
	reg02: reg_16bit port map(
		input => register_input,
		load => load_reg2,
		clk => clk,
		output => reg2_out
	);
	
	-- register r3
	reg03: reg_16bit port map(
		input => register_input,
		load => load_reg3,
		clk => clk,
		output => reg3_out
	);
	
	-- Source multiplexer
	srcmux: mux4_16bit port map(
		in0 => reg0_out,
		in1 => reg1_out,
		in2 => reg2_out,
		in3 => reg3_out,
		s => src,
		output => selected_soruce_register
	);
	
	-- Data Selector (register/memory)
	datasrc: mux2_16bit port map(
		in0 => data,
		in1 => selected_soruce_register,
		s => data_src,
		output => register_input
	);

	decoder: decoder_2to4 port map(
		a => des,
		q0 => load_reg0,
		q1 => load_reg1,
		q2 => load_reg2,
		q3 => load_reg3		
	);
	
	-- Assign outputs of register file (to go to Function/Logic unit)
--	reg0 <= reg0_out;
--	reg1 <= reg1_out;
--	reg2 <= reg2_out;
--	reg3 <= reg3_out;

	reg0 <= reg0_out;
	reg1 <= reg1_out;
	reg2 <= reg2_out;
	reg3 <= reg3_out;
	
end Behavioral;

