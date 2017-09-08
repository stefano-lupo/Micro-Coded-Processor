
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY arithmetic_unit_TB IS
END arithmetic_unit_TB;
 
ARCHITECTURE behavior OF arithmetic_unit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arithmetic_unit
    PORT(
         a 				: IN  std_logic_vector(15 downto 0);
         b 				: IN  std_logic_vector(15 downto 0);
         cin 			: IN  std_logic;
         op_select 	: IN  std_logic_vector(1 downto 0);
         output 		: OUT  std_logic_vector(15 downto 0);
         cout 			: OUT  std_logic;
			cout_second_last : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal cin : std_logic := '0';
   signal op_select : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);
	signal cout : std_logic;
	signal cout_second_last : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmetic_unit PORT MAP (
          a => a,
          b => b,
          cin => cin,
          op_select => op_select,
          output => output,
          cout => cout,
			 cout_second_last => cout_second_last
        );

   -- Clock process definitions
   --<clock>_process :process
  -- begin
	--	<clock> <= '0';
		--wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		cin <= '0';
		a <= "0000000000000001";
		--a <= "1111111111111111";
		b <= "0000000000000010";
		
		op_select <= "00";
		wait for 10 ns;
		
		op_select <= "01";
		wait for 10 ns;
		
		op_select <= "10";
		wait for 10 ns;
		
		op_select <= "11";
		wait for 10 ns;

      --wait for <clock>_period*10;
		wait for 100 ns;
		
		
		-- setting subtract bit
		cin <= '1';
		
		op_select <= "00";
		wait for 10 ns;
		
		op_select <= "01";
		wait for 10 ns;
		
		op_select <= "10";
		wait for 10 ns;
		
		op_select <= "11";
		wait for 10 ns;
		

      -- insert stimulus here 

      wait;
   end process;

END;
