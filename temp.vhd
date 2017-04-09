
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity temp is
	port(
		clock : in std_logic;
		load : in std_logic;
		output : out std_logic_vector(7 downto 0);
		in0 	: in std_logic_vector(7 downto 0);
		in1 : in std_logic_vector(7 downto 0);
		s	: in std_logic
		
	);
end temp;

architecture Behavioral of temp is
	
	component control_address_register
		Port(
			clock : in std_logic;
			load : in std_logic;
			address : in std_logic_vector(7 downto 0);
			output : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component mux2_8bit
		port(
			in0 : in std_logic_vector(7 downto 0);
			in1 : in std_logic_vector(7 downto 0);
			s 	 : in std_logic;
			output : out std_logic_vector(7 downto 0)
		);
	end component;
	
	
	-- intenral
	signal muxOut : std_logic_vector(7 downto 0);
begin
	car: control_address_register port map (
		clock => clock,
		load => load,
		address => muxOut,
		output => output
	);
	
	mux : mux2_8bit port map (
		in0 => in0,
		in1 => in1,
		s => s,
		output => muxOut
	);	

end Behavioral;

