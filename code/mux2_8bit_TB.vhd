
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY mux2_8bit_TB IS
END mux2_8bit_TB;
 
ARCHITECTURE behavior OF mux2_8bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2_8bit
    PORT(
         in0 : IN  std_logic_vector(7 downto 0);
         in1 : IN  std_logic_vector(7 downto 0);
         s : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(7 downto 0) := (others => '0');
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_8bit PORT MAP (
          in0 => in0,
          in1 => in1,
          s => s,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      in0 <= x"00";
		in1 <= x"11";
		s <= '0';
		wait for 10ns;
		
		s<= '1';
		


      wait;
   end process;

END;
