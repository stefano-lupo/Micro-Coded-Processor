
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity instruction_register is
	Port(	input				: in std_logic_vector(15 downto 0);
			IL					: in std_logic := '1';
			clock				: in std_logic;
			opCode			: out std_logic_vector(7 downto 0);
			destReg			: out std_logic_vector(2 downto 0);
			sourceRegA		: out std_logic_vector(2 downto 0);
			sourceRegB		: out std_logic_vector(2 downto 0)
	);
end instruction_register;


architecture Behavioral of instruction_register is

begin

	process(clock)
		begin
			if rising_edge(clock) then
				if IL = '1' then
					sourceRegB <= input(2 downto 0);
					sourceRegA <= input(5 downto 3);
					destReg	<= input (8 downto 6);
					opcode <= '0' & input(15 downto 9) after 5 ns;
				end if;
			end if;
	end process;
end Behavioral;

