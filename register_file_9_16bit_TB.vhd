
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY register_file_9_16bit_TB IS
END register_file_9_16bit_TB;
 
ARCHITECTURE behavior OF register_file_9_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file_9_16bit
    PORT(
         a_selector : IN  std_logic_vector(3 downto 0);
         b_selector : IN  std_logic_vector(3 downto 0);
         aOut : OUT  std_logic_vector(15 downto 0);
         bOut : OUT  std_logic_vector(15 downto 0);
         des : IN  std_logic_vector(3 downto 0);
         dataIn : IN  std_logic_vector(15 downto 0);
         rw : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a_selector : std_logic_vector(3 downto 0) := (others => '0');
   signal b_selector : std_logic_vector(3 downto 0) := (others => '0');
   signal des : std_logic_vector(3 downto 0) := (others => '0');
   signal dataIn : std_logic_vector(15 downto 0) := (others => '0');
   signal rw : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal aOut : std_logic_vector(15 downto 0);
   signal bOut : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file_9_16bit PORT MAP (
          a_selector => a_selector,
          b_selector => b_selector,
          aOut => aOut,
          bOut => bOut,
          des => des,
          dataIn => dataIn,
          rw => rw,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		rw <= '1';
		
		dataIn <= "1111111111111111";
		des <= "0000";
		wait for clk_period*10;
		
		
		dataIn <= "1010101010101010";
		des <= "0001";
		wait for clk_period*10;		


		rw <= '0';
		
		a_selector <= "0000";
		wait for clk_period*10;
		
		
		b_selector <= "0001";

      wait;
   end process;

END;
