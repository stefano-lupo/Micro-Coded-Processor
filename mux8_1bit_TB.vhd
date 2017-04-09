
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux8_1bit_TB IS
END mux8_1bit_TB;
 
ARCHITECTURE behavior OF mux8_1bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8_1bit
    PORT(
         inputs : IN  std_logic_vector(7 downto 0);
         s : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inputs : std_logic_vector(7 downto 0) := (others => '0');
   signal s : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8_1bit PORT MAP (
          inputs => inputs,
          s => s,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		
		inputs <= x"A5";
		
		
		s <= "000";
		wait for 10 ns;
		
		s <= "001";
		wait for 10 ns;
		
		s <= "010";
		wait for 10 ns;
		
		s <= "011";
		wait for 10 ns;
		
		s <= "100";
		wait for 10 ns;
		
		s <= "101";
		wait for 10 ns;
		
		s <= "110";
		wait for 10 ns;
		
		s <= "111";
		wait for 10 ns;
		
      wait;
   end process;

END;
