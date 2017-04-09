
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity control_address_register is
	Port(
		clock : in std_logic;
		load : in std_logic;
		address : in std_logic_vector(7 downto 0);
		output : out std_logic_vector(7 downto 0)
	);
end control_address_register;

architecture Behavioral of control_address_register is

signal currentCAR: std_logic_vector( 7 downto 0) := X"00";


begin
	
	

	process(clock)
		begin
			if(rising_edge(clock)) then
				if load = '1' then
					currentCAR <= address after 0 ns;
				else 
					currentCAR <= std_logic_vector(unsigned(currentCAR) + 1) after 0 ns;
				end if;
			end if;
	end process;
	
	output <= currentCAR;
end Behavioral;

