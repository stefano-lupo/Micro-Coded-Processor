
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY unit_shifter_1bit_TB IS
END unit_shifter_1bit_TB;
 
ARCHITECTURE behavior OF unit_shifter_1bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unit_shifter_1bit
    PORT(
         shiftDir : IN  std_logic_vector(1 downto 0);
         bits : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal shiftDir : std_logic_vector(1 downto 0) := (others => '0');
   signal bits : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unit_shifter_1bit PORT MAP (
          shiftDir => shiftDir,
          bits => bits,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		bits <= "001";
		
		-- no shift
		shiftDir <= "00";
		wait for 20 ns;
		
		-- shift right
		shiftDir <= "01";
		wait for 20 ns;
		
		
		-- shift left
		shiftDir <= "10";
		wait for 20 ns;

      wait;
   end process;

END;
