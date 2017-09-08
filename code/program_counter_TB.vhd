
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY program_counter_TB IS
END program_counter_TB;
 
ARCHITECTURE behavior OF program_counter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT program_counter
    PORT(
         offset : IN  std_logic_vector(5 downto 0);
         pl : IN  std_logic;
         pi : IN  std_logic;
			clock : IN std_logic;
         toMemory : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal offset : std_logic_vector(5 downto 0) := (others => '0');
   signal pl : std_logic := '0';
   signal pi : std_logic := '0';
	signal clock : std_logic := '0';

 	--Outputs
   signal toMemory : std_logic_vector(15 downto 0);
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: program_counter PORT MAP (
          offset => offset,
          pl => pl,
          pi => pi,
			 clock => clock,
          toMemory => toMemory
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

		-- Branch PC by + 2
      offset <= "000010";
		pi <= '0';
		pl <= '1';
		wait for clock_period;
		
		-- Hold PC value
		pi <= '0';
		pl <= '0';
		wait for clock_period;
		
		-- Branch PC value by -1
		offset <= "111111";
		pi <= '0';
		pl <= '1';
		wait for clock_period;
		
		-- Hold PC value
		pi <= '0';
		pl <= '0';
		wait for clock_period;
		
		-- Increment PC Value
		pi <= '1';
		pl <= '0';
		wait for clock_period;
		
		-- Hold PC Value
		pi <= '0';
		pl <= '0';
		wait for clock_period;

      wait;
   end process;

END;
