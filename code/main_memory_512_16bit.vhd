
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity main_memory_512_16bit is
	Port(	address			: in std_logic_vector(15 downto 0);
			writeData	 	: in std_logic_vector(15 downto 0);
			mw					: in std_logic;
			readData			: out std_logic_vector(15 downto 0)	-- To Instruction Register
	);
end  main_memory_512_16bit;

architecture Behavioral of  main_memory_512_16bit is

	-- Array of memory
	type memArray is array(0 to 20) of std_logic_vector(15 downto 0);
	
	
begin
	
	memProc: process(address,writeData)
		variable dataMem : memArray := (
-- 			Opcode   &  DR & SA  & SB		
		
				-- Branch to start of program
				"0001001"&"000"&"000"&"111",		-- 0 b start	
				
				-- Data in memory
				x"0004",									-- 1
				x"0005",									-- 2
				x"0006",									-- 3
				x"0007",									-- 4
				x"0008",									-- 5
				x"0009",									-- 6
				x"000a",									-- 7
				
				
				-- Instructions for our program
-- start				
				"0001000"&"000"&"000"&"011",		-- 8  mov r0,#3		; r0 = 3
				"0000011"&"001"&"000"&"111",		-- 9  ldr r1,[r0] 	; r1 = 6
				"0000111"&"010"&"000"&"001",		-- 10 add r2,r0,r1	; r2 = 9
				"0000101"&"011"&"010"&"111",		-- 11 inc r3,r2		; r3 = 10
				"0000110"&"100"&"011"&"111",		-- 12 not r4,r3		; r4 = !r3	
				
				-- Control flow statments
				"0001010"&"000"&"000"&"010",		-- 13 bz zero			; branch to zero if r4 is zero	
				"0000010"&"101"&"010"&"100",		-- 14 adi r5,r2,#4	; r5 = 13				
				"0001001"&"000"&"000"&"001",		-- 15 b skip			; branch to skip
				
-- zero		
				"0001000"&"101"&"000"&"100",		-- 16 mov r5,#4		; r5 = 4	
				
-- skip
				-- Set shift counter
				"0001000"&"110"&"000"&"011",		-- 17  mov r6,#3		; r6 = 3				
				-- Perform shift instruction
				"0001110"&"101"&"110"&"101",		-- 18  sr r5,r6,r5	; shift r5 right r6 times
	
				-- Perform final instruction
				"0001000"&"111"&"000"&"111",		-- 19  mov r7,#7		; r7 = 7
				
				
-- end of program
				"0001001"&"111"&"000"&"111"		-- 20 stop b stop (branch -1)
		);
		
		
		
		
		variable addrInt:integer;
	
		begin
		
			addrInt := to_integer(unsigned(address));
			-- Testing address (only 3 bit)
			-- Proper address space
			-- addrInt := conv_integer(address(8 downto 0));
			
		if mw = '1' then
			dataMem(addrInt) := writeData;
		else
			if mw = '0' then
				readData <= dataMem(addrInt) after 1 ns;
			end if;
		end if;
	end process;
end Behavioral;