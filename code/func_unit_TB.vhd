
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY func_unit_TB IS
END func_unit_TB;
 
ARCHITECTURE behavior OF func_unit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT functional_unit
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         fs_control : IN  std_logic_vector(4 downto 0);
         output : OUT  std_logic_vector(15 downto 0);
         v : OUT  std_logic;
         c : OUT  std_logic;
         n : OUT  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal fs_control : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);
   signal v : std_logic;
   signal c : std_logic;
   signal n : std_logic;
   signal z : std_logic;

 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: functional_unit PORT MAP (
          a => a,
          b => b,
          fs_control => fs_control,
          output => output,
          v => v,
          c => c,
          n => n,
          z => z
        );

   -- Clock process definitions
  -- <clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		a <= "0111111111111111";
		b <= "0111111111111111";
      wait for 100 ns;	
	
		
		
		-- Start arithmetic operations
	
		fs_control <= "00000";
		wait for 20 ns;
		
		fs_control <= "00001";
		wait for 20 ns;
		
		fs_control <= "00010";
		wait for 20 ns;
		
		fs_control <= "00011";
		wait for 20 ns;
		
		fs_control <= "00100";
		wait for 20 ns;
		
		fs_control <= "00101";
		wait for 20 ns;
		
		fs_control <= "00110";
		wait for 20 ns;
		
		fs_control <= "00111";
		wait for 20 ns;
		
		
		
		-- Start logic operations
		
		fs_control <= "01000";
		wait for 20 ns;
		
		fs_control <= "01010";
		wait for 20 ns;
		
		fs_control <= "01100";
		wait for 20 ns;
		
		fs_control <= "01110";
		wait for 20 ns;
		
		
		
		-- start shift operations
		
		fs_control <= "10000";
		wait for 20 ns;
		
		fs_control <= "10100";
		wait for 20 ns;
		
		fs_control <= "11000";
		wait for 20 ns;
		
		
		
      --wait for <clock>_period*10;

      wait;
   end process;

END;
