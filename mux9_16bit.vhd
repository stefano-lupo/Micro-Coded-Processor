library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux9_16bit is
	Port(	in0,in1,in2,in3,in4,in5,in6,in7,in8	: in std_logic_vector(15 downto 0);
			s 												: in std_logic_vector(3 downto 0);
			output 										: out std_logic_vector(15 downto 0));
end mux9_16bit;

architecture Behavioral of mux9_16bit is
begin
   process ( s,in0,in1,in2,in3,in4,in5,in6,in7,in8)
		begin
		case s is
			when "0000" => output <= in0 after 1 ns;
			when "0001" => output <= in1 after 1 ns;
			when "0010" => output <= in2 after 1 ns;
			when "0011" => output <= in3 after 1 ns;
			when "0100" => output <= in4 after 1 ns;
			when "0101" => output <= in5 after 1 ns;
			when "0110" => output <= in6 after 1 ns;
			when "0111" => output <= in7 after 1 ns;
			when others => output <= in8 after 1 ns;	-- use R8 if msb set
		end case;
	end process;
end Behavioral;

