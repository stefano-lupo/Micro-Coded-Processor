
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY shifter_16bit_TB IS
END shifter_16bit_TB;
 
ARCHITECTURE behavior OF shifter_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifter_16bit
    PORT(
         b : IN  std_logic_vector(15 downto 0);
         h_select : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal h_select : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifter_16bit PORT MAP (
          b => b,
          h_select => h_select,
          output => output
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		
		b <= "1111000011110000";
		
		-- no shift
		h_select <= "00";
		wait for 20 ns;
		
		-- shift left
		h_select <= "10";
		wait for 20 ns;
		
		-- shift right
		h_select <= "01";
		wait for 20 ns;
		
		



      -- insert stimulus here 

      wait;
   end process;

END;
