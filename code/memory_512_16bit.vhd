
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory_512_16bit is
	Port(	address			: in unsigned std_logic_vector(15 downto 0);
			writeData	 	: in std_logic_vector(15 downto 0);
			memWrite			: in std_logic;
			memRead			: in std_logic;
			readData			: out std_logic_vector(15 downto 0)	
	);
end memory_512_16bit;

architecture Behavioral of memory_512_16bit is

	-- Array of memory
	type memArray is array(0 to 7) of std_logic_vector(15 downto 0);
	
	--signal addr9bit : std_logic_vector(8 downto 0);
	
begin
	memProc: process(address,writeData)
		variable dataMem : memArray := (
			x"0003",x"000C",x"0030",x"00C0",x"0300",x"0C00",x"3000",x"C000"
		);
		variable addrInt:integer;
		
		begin
			-- Testing address (only 3 bit)
			addrInt := conv_integer(address(2 downto 0));
			
			-- Proper address space
			-- addrInt := conv_integer(address(8 downto 0));
			
		if memWrite = '1' then
			dataMem(addrInt) := writeData;
		else
			if memRead = '1' then
				readData <=  x"FFFF" after 10 ns; --dataMem(addrInt)
			end if;
		end if;
	end process;
end Behavioral;