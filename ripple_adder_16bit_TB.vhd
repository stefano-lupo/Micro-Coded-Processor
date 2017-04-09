
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ripple_adder_16bit_TB IS
END ripple_adder_16bit_TB;
 
ARCHITECTURE behavior OF ripple_adder_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_adder_16bit
    PORT(
         a 					: IN  std_logic_vector(15 downto 0);
         b 					: IN  std_logic_vector(15 downto 0);
			cin 				: IN std_logic;
         output 			: OUT  std_logic_vector(15 downto 0);
			c_second_last 	: OUT std_logic;
         cout 				: OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a 					: std_logic_vector(15 downto 0) := (others => '0');
   signal b 					: std_logic_vector(15 downto 0) := (others => '0');
	signal cin 					: std_logic := '0';

 	--Outputs
	signal output 				: std_logic_vector(15 downto 0);
	signal c_second_last : std_logic;
   signal cout 				: std_logic;


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_adder_16bit PORT MAP (
          a => a,
          b => b,
          cin => cin,
          output => output,
			 c_second_last => c_second_last,
          cout => cout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
	
	
		cin <= '0';
		a <= "1111111111111110";
		b <= "0000000000000001";
		
      wait for 10ns; 


		a <= "1111111111111111";
		b <= "0000000000000001";
		
      wait for 10ns; 
		
		a <= "0000000000000011";
		b <= "0000000000000011";
		
		
      wait for 100ns; 
		
		cin <= '1';
		
		a <= "0000000000000000";
		b <= "0000000000000000";
		
		wait for 10 ns;
		
		a <= "0000000000000001";
		b <= "0000000000000000";
		
		wait for 10 ns;
		
		a <= "0000000000000000";
		b <= "0000000000000001";
		
		wait for 10 ns;
		
		a <= "0000000000000001";
		b <= "0000000000000001";
		
		wait for 10 ns;
		
		
   

      wait;
   end process;

END;
