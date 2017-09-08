
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY alu_TB IS
END alu_TB;
 
ARCHITECTURE behavior OF alu_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         control : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(15 downto 0);
			cout		: OUT std_logic;
			cout_second_last : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal control : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);
	signal cout : std_logic;
	signal cout_second_last : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          a => a,
          b => b,
          control => control,
          output => output,
			 cout => cout,
			 cout_second_last => cout_second_last 
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		
		a <= "0000000000000001";
		b <= "0000000000000010";
		
		control <= "0000";
		wait for 20 ns;
		
		control <= "0001";
		wait for 20 ns;
		
		control <= "0010";
		wait for 20 ns;
		
		control <= "0011";
		wait for 20 ns;
		
		control <= "0100";
		wait for 20 ns;
		
		control <= "0101";
		wait for 20 ns;
		
		control <= "0110";
		wait for 20 ns;
		
		control <= "0111";
		wait for 20 ns;
		
		control <= "1000";
		wait for 20 ns;
		
		control <= "1010";
		wait for 20 ns;
		
		control <= "1100";
		wait for 20 ns;
		
		control <= "1110";
		wait for 20 ns;


      wait;
   end process;

END;
