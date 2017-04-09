----------------------------------------------------------------------------
-- 4 to 1 1bit multiplexer
-- Inputs: 
--				a			: 	Option 0
--				b			:	Option 1
--				c			:	Option 2
--				d			: 	Option 3
--				s			:  2 bit selector vector
-- Outputs:	
--				output	: 	Selected Option
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2_1bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
			  s : in std_logic_vector (1 downto 0);
			  output : out std_logic
			  );
end mux2_1bit;

architecture Behavioral of mux2_1bit is

begin
	process (s,a,b,c,d)
		begin
		case  s is
			when "00" => output <= a after 1 ns;
			when "01" => output <= b after 1 ns;
			when "10" => output <= c after 1 ns;
			when "11" => output <= d after 1 ns;
			when others => output <= a after 1 ns;
		end case;
	end process;

end Behavioral;

