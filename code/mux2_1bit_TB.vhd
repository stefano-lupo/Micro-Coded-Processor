
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux2_1bit_TB IS
END mux2_1bit_TB;
 
ARCHITECTURE behavior OF mux2_1bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2_1bit
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         d : IN  std_logic;
         s : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';
   signal d : std_logic := '0';
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_1bit PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          s => s,
          output => output
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		a <= '1';
		b <= '0';
		c <= '1';
		d <= '0';
		
		s <= "00";
		wait for 10ns;
		
		s <= "01";
		wait for 10ns;
		
		s <= "10";
		wait for 10ns;
		
		s <= "11";
		wait for 10ns;

      -- insert stimulus here 

      wait;
   end process;

END;
