library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux8_16bit is
	Port(	in0,in1,in2,in3,in4,in5,in6,in7 		: in std_logic_vector(15 downto 0);
			s 												: in std_logic_vector(2 downto 0);
			output 										: out std_logic_vector(15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is
begin
   process ( s,in0,in1,in2,in3)
		begin
		case s is
			when "000" => output <= in0 after 1 ns;
			when "001" => output <= in1 after 1 ns;
			when "010" => output <= in2 after 1 ns;
			when "011" => output <= in3 after 1 ns;
			when "100" => output <= in4 after 1 ns;
			when "101" => output <= in5 after 1 ns;
			when "110" => output <= in6 after 1 ns;
			when "111" => output <= in7 after 1 ns;
			when others => output <= in1 after 1 ns;
		end case;
	end process;
end Behavioral;

