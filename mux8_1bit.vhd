
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_1bit is
	Port(
		inputs : in std_logic_vector(7 downto 0);
		s : in std_logic_vector(2 downto 0);
		output : out std_logic
	);
end mux8_1bit;

architecture Behavioral of mux8_1bit is

begin
	process (s,inputs)
		begin
		case  s is
			when "000" => output <= inputs(0) after 1 ns;
			when "001" => output <= inputs(1) after 1 ns;
			when "010" => output <= inputs(2) after 1 ns;
			when "011" => output <= inputs(3) after 1 ns;
			when "100" => output <= inputs(4) after 1 ns;
			when "101" => output <= inputs(5) after 1 ns;
			when "110" => output <= inputs(6) after 1 ns;
			when "111" => output <= inputs(7) after 1 ns;
			when others => output <= '1' after 1 ns;
		end case;
	end process;
	
end Behavioral;

