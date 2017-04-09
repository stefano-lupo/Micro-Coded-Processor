
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY control_memory_256_28bit_TB IS
END control_memory_256_28bit_TB;
 
ARCHITECTURE behavior OF control_memory_256_28bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_memory_256_28bit
    PORT(
         CAR : IN  std_logic_vector(7 downto 0);
         MW : OUT  std_logic;
         MM : OUT  std_logic;
         RW : OUT  std_logic;
         MD : OUT  std_logic;
         FS : OUT  std_logic_vector(4 downto 0);
         MB : OUT  std_logic;
         TB : OUT  std_logic;
         TA : OUT  std_logic;
         TD : OUT  std_logic;
         PL : OUT  std_logic;
         PI : OUT  std_logic;
         IL : OUT  std_logic;
         MC : OUT  std_logic;
         MS : OUT  std_logic_vector(2 downto 0);
         NA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CAR : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MW : std_logic;
   signal MM : std_logic;
   signal RW : std_logic;
   signal MD : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MB : std_logic;
   signal TB : std_logic;
   signal TA : std_logic;
   signal TD : std_logic;
   signal PL : std_logic;
   signal PI : std_logic;
   signal IL : std_logic;
   signal MC : std_logic;
   signal MS : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_memory_256_28bit PORT MAP (
          CAR => CAR,
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          FS => FS,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          MS => MS,
          NA => NA
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
--			NA			    	MS	   	MC,IL		PI,PL    tD,tA,tB,MB	  FS      MD RW MM  MW
----------------------------------------------------------------------------------------------------------------			
-- 		Instruction Fetch (Gets next instruction into IR)
--			"00000001"	&	"000"	&	"01"	&	"10"	&	"0000"	&	"00000"	&	"0010",		-- 0
			
-- 		Instruction Decode (Gets next opcode into CAR)	
--			"11111111"	&	"001"	&	"10"	&	"00"	&	"0000"	&	"00000"	&	"0000",		-- 1

--			Add Imediate
--			"00000000"	&	"001"	&	"00"	&	"00"	&	"0001"	&	"00010"	&	"0100",		-- 2
			
		-- Access controlMemory[0]
		CAR <= x"00";
		wait for 10 ns;
		
		-- Access controlMemory[1]
		CAR <= x"01";
		wait for 10 ns;
		
		-- Access controlMemory[2]
		CAR <= x"02";
		wait for 10 ns;

      wait;
   end process;

END;
