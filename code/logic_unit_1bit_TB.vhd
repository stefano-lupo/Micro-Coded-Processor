
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY logic_unit_1bit_TB IS
END logic_unit_1bit_TB;
 
ARCHITECTURE behavior OF logic_unit_1bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logic_unit_1bit
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         s : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal s : std_logic_vector(1 downto 0) := (others => '0');
   signal output : std_logic := '0';

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logic_unit_1bit PORT MAP (
          a => a,
          b => b,
          s => s,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		a <= '0';
		b <= '0';

		s <= "00";
		wait for 10ns;
		
		s <= "01";
		wait for 10ns;
		
		s <= "10";
		wait for 10ns;
		
		s <= "11";
		wait for 100ns;
		
		
		a <= '0';
		b <= '1';

		s <= "00";
		wait for 10ns;
		
		s <= "01";
		wait for 10ns;
		
		s <= "10";
		wait for 10ns;
		
		s <= "11";
		wait for 100ns;

		
		a <= '1';
		b <= '0';

		s <= "00";
		wait for 10ns;
		
		s <= "01";
		wait for 10ns;
		
		s <= "10";
		wait for 10ns;
		
		s <= "11";
		wait for 100ns;
		
		
		
		a <= '1';
		b <= '1';

		s <= "00";
		wait for 10ns;
		
		s <= "01";
		wait for 10ns;
		
		s <= "10";
		wait for 10ns;
		
		s <= "11";
		wait for 100ns;

      wait;
   end process;

END;
