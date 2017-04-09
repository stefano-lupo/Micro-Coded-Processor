LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY temp_TB IS
END temp_TB;
 
ARCHITECTURE behavior OF temp_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT temp
    PORT(
         clock : IN  std_logic;
         load : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0);
         in0 : IN  std_logic_vector(7 downto 0);
         in1 : IN  std_logic_vector(7 downto 0);
         s : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal load : std_logic := '0';
   signal in0 : std_logic_vector(7 downto 0) := (others => '0');
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: temp PORT MAP (
          clock => clock,
          load => load,
          output => output,
          in0 => in0,
          in1 => in1,
          s => s
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
		
		in0 <= "00000000";
		in1 <= "00000001";
		s <= '0';
		load <= '0';
		wait for clock_period;
		
		load <='1';
		wait for clock_period;
		
		s <= '1';
		wait for clock_period;
		
		load <= '1';
		wait for clock_period;
      wait;
   end process;

END;
