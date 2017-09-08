
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity program_counter is
	port(
		offset	: in std_logic_vector(5 downto 0);
		pl			: in std_logic := '0';
		pi 		: in std_logic := '0';
		clock		: in std_logic;
		toMemory : out std_logic_vector(15 downto 0)
	);
end program_counter;

architecture Behavioral of program_counter is
signal currentPC: std_logic_vector( 15 downto 0) := X"0000";
begin
	process(clock)
		variable offsetInt : integer;
			begin
				if(rising_edge(clock)) then 
					offsetInt := to_integer(signed(offset));
					
					if pl = '1' then
							currentPC <= std_logic_vector(signed(currentPC) + offsetInt);
					else 
						if pi = '1' then
								currentPC <= std_logic_vector(unsigned(currentPC) + 1);
						end if;
					end if;
				end if;
	end process;
	
	toMemory <= currentPC;
end Behavioral;

