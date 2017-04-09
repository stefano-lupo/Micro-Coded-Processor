
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;



entity control_memory_256_28bit is
	Port(
		CAR: in std_logic_vector(7 downto 0); -- Address to select
		MW: out std_logic; -- to main memory 
		MM: out std_logic; -- Main mem address from PC or datapath
		RW: out std_logic; -- Into register file
		MD: out std_logic; -- Select between output of FU or memoy
		FS: out std_logic_vector(4 downto 0);
		MB: out std_logic; -- Feed functional unit with Reg B or constant from opcode
		TB: out std_logic; -- temp b flag
		TA: out std_logic; -- temp a flag
		TD: out std_logic; -- temp dest flag
		PL: out std_logic; -- something with PC
		PI: out std_logic; -- something with PC
		IL: out std_logic; -- Inst Reg latch signal
		MC: out std_logic; -- Car take next address or opcode 
		MS: out std_logic_vector(2 downto 0); -- Picks conditional branch
		NA: out std_logic_vector(7 downto 0)  -- Next Address
	);
end control_memory_256_28bit;

architecture Behavioral of control_memory_256_28bit is

-- Full memory
--type mem_array is array (0 to 255) of std_logic_vector(27 downto 0);


type mem_array is array (0 to 19) of std_logic_vector(27 downto 0);

begin
	--	"NextAddr" "ms" "mc,il" "pi,pl" "td,ta,tb,mb" "fs" "md,rw,mm,mw"
	process(CAR)
		variable control_mem : mem_array := (
		
--			NA			    	MS	   	MC,IL		PI,PL    tD,tA,tB,MB	  FS      MD RW MM  MW
----------------------------------------------------------------------------------------------------------------			
-- 		Instruction Fetch (Gets next instruction into IR)
			"00000001"	&	"000"	&	"01"	&	"10"	&	"0000"	&	"00000"	&	"0010",		-- 0
			
-- 		Instruction Decode (Gets next opcode into CAR)	
			"11111111"	&	"001"	&	"10"	&	"00"	&	"0000"	&	"00000"	&	"0000",		-- 1
			
--			Add Imediate
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0001"	&	"00010"	&	"0100",		-- 2
			
-- 		Load from Memory
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"1100", 		-- 3
			
--			Store to Memory				
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"0001",		-- 4
			
--			Increment Register A		
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00001"	&	"0100",		-- 5
			
--			Not Register A	
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"01110"	&	"0100",		-- 6
			
--			Add Two Registers			
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00010"	&	"0110",		-- 7
			
--			Load Immediate
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0001"	&	"10000"	&	"0110",		-- 8 	
			
--			Uncodintional Branch
			"00000000"	&	"001"	&	"00"	&	"01"	&	"0001"	&	"00000"	&	"0000",		-- 9 

--			Branch if Zero : Branch to unconditional branch if zero, otherwise go to next IF
			"00001001"	&	"100"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"0000",		-- 10 
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"0000",		-- 11	-- GOTO IF
			
--			Decrement
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00110"	&	"0100",		-- 12
			
--			Shift Right (1 place)
			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"10100"	&	"0100",		-- 13		
			
			
			
--			Shift Right ('Port A' places)

--			Put value of port A into R8 as counter
			"11111111"	&	"000"	&	"00"	&	"00"	&	"1000"	&	"00000"	&	"0100",		-- 14

--			Check if R8 is zero -> go to IF if it is
			"00000000"	&	"100"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"0000",		-- 15

--			else 

--			shift right 
			"11111111"	&	"000"	&	"00"	&	"00"	&	"0000"	&	"10100"	&	"0100",		-- 16
--			Decrement counter
			"11111111"	&	"000"	&	"00"	&	"00"	&	"1100"	&	"00110"	&	"0100",		-- 17
			
--			Check if R8 is zero -> go to IF if it is
			"00000000"	&	"100"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"0000",		-- 18
			
--			go back to shifting [16] otherwise
			"00010000" 	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"0000"		-- 19
			
			
--			Shift Right 3 places
--			"11111111"	&	"000"	&	"00"	&	"00"	&	"0000"	&	"10100"	&	"0100",		-- 20
--			"11111111"	&	"000"	&	"00"	&	"00"	&	"0000"	&	"10100"	&	"0100",		-- 21
--			"11111111"	&	"000"	&	"00"	&	"00"	&	"0000"	&	"10100"	&	"0100",		-- 22
--			"00000000"	&	"001"	&	"00"	&	"00"	&	"0000"	&	"00000"	&	"0000"		-- 23	-- GOTO IF

			);
			
			
			
		variable address : integer;
		variable control_out : std_logic_vector(27 downto 0);
		
	begin 
		address := to_integer(unsigned(CAR));
		control_out := control_mem(address);
		MW <= control_out(0);
		MM <= control_out(1);
		RW <= control_out(2);
		MD <= control_out(3);
		FS <= control_out(8 downto 4);
		MB <= control_out(9);
		TB <= control_out(10);
		TA <= control_out(11);
		TD <= control_out(12);
		PL <= control_out(13);
		PI <= control_out(14);
		IL <= control_out(15);
		MC <= control_out(16);
		MS <= control_out(19 downto 17);
		NA <= control_out(27 downto 20);
	end process;

end Behavioral;
