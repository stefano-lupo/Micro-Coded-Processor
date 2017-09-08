LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY decoder_4to9_TB IS
END decoder_4to9_TB;
 
ARCHITECTURE behavior OF decoder_4to9_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_4to9
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(8 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_4to9 PORT MAP (
          a => a,
          q => q
        );

 

   -- Stimulus process
   stim_proc: process
   begin		

		a <= "0000";
		wait for 10 ns;
		
		a <= "0001";
		wait for 10 ns;
		
		a <= "0010";
		wait for 10 ns;
		
		a <= "0011";
		wait for 10 ns;
		
		
		
		a <= "0100";
		wait for 10 ns;
		
		a <= "0101";
		wait for 10 ns;
		
		a <= "0110";
		wait for 10 ns;
		
		a <= "0111";
		wait for 10 ns;
		
		
		
		a <= "1000";
		wait for 10 ns;
		
		a <= "1001";
		wait for 10 ns;
		
		a <= "1010";
		wait for 10 ns;

      wait;
   end process;

END;
