
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY main_memory_512x16bit_TB IS
END main_memory_512x16bit_TB;
 
ARCHITECTURE behavior OF main_memory_512x16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main_memory_512_16bit
    PORT(
         address : IN  std_logic_vector(15 downto 0);
         writeData : IN  std_logic_vector(15 downto 0);
         mw : IN  std_logic;
         readData : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(15 downto 0) := (others => '0');
   signal writeData : std_logic_vector(15 downto 0) := (others => '0');
   signal mw : std_logic := '0';

 	--Outputs
   signal readData : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main_memory_512_16bit PORT MAP (
          address => address,
          writeData => writeData,
          mw => mw,
          readData => readData
        );


   -- Stimulus process
   stim_proc: process
   begin			
	
		-- Data in memory
--		x"0004",									-- 1
--		x"0005",									-- 2
--		x"0006",									-- 3
--		x"0007",									-- 4
--		x"0008",									-- 5
--		x"0009",									-- 6
--		x"000a",									-- 7
			
--		load in value from memory[1] 
		mw <= '0';
		address <= x"0001";
		wait for 100 ns;
		
--		load in value from memory[2] 
		address <= x"0002";
		mw <= '0';
		wait for 100 ns;
		
-- 	store value in memory [3]
		address <= x"0003";
		writeData <= x"ffff";
		mw <= '1';
		wait for 100 ns;


      wait;
   end process;

END;
