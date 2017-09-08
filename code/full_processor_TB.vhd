
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY full_processor_TB IS
END full_processor_TB;
 
ARCHITECTURE behavior OF full_processor_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_processor
    PORT(
         clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';

   -- Clock period definitions
   constant clock_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_processor PORT MAP (
          clock => clock
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for clock_period;
		
		wait for clock_period;
      -- insert stimulus here 

      wait;
   end process;

END;
