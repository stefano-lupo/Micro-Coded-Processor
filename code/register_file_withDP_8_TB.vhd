
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_file_withDP_8_TB IS
END register_file_withDP_8_TB;
 
ARCHITECTURE behavior OF register_file_withDP_8_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file_8
    PORT(
         a_selector : IN  std_logic_vector(2 downto 0);
         b_selector : IN  std_logic_vector(2 downto 0);
         aOut : OUT  std_logic_vector(15 downto 0);
         bOut : OUT  std_logic_vector(15 downto 0);
         des : IN  std_logic_vector(2 downto 0);
         dataIn : IN  std_logic_vector(15 downto 0);
         writeSig : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a_selector : std_logic_vector(2 downto 0) := (others => '0');
   signal b_selector : std_logic_vector(2 downto 0) := (others => '0');
   signal des : std_logic_vector(2 downto 0) := (others => '0');
   signal dataIn : std_logic_vector(15 downto 0) := (others => '0');
   signal writeSig : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal aOut : std_logic_vector(15 downto 0);
   signal bOut : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file_8 PORT MAP (
          a_selector => a_selector,
          b_selector => b_selector,
          aOut => aOut,
          bOut => bOut,
          des => des,
          dataIn => dataIn,
          writeSig => writeSig,
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
		
		writeSig <= '1';
		
		a_selector <= "000";
		b_selector <= "001";
		
		dataIn <= "1111111111111111";
		des <= "000";
		wait for clk_period*10;
		
		
		dataIn <= "0000000000000000";
		des <= "001";
		wait for clk_period*10;		


		writeSig <= '0';
		
		a_selector <= "000";
		wait for clk_period*10;
		
		
		b_selector <= "001";

      wait;
   end process;

END;
