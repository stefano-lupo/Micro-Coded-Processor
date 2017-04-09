
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY branch_unit_TB IS
END branch_unit_TB;
 
ARCHITECTURE behavior OF branch_unit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT branch_unit
    PORT(
         n : IN  std_logic;
         z : IN  std_logic;
         c : IN  std_logic;
         v : IN  std_logic;
         ms : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal n : std_logic := '0';
   signal z : std_logic := '0';
   signal c : std_logic := '0';
   signal v : std_logic := '0';
   signal ms : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: branch_unit PORT MAP (
          n => n,
          z => z,
          c => c,
          v => v,
          ms => ms,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
		
		-- Test Condition Code Flags
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		
		-- No Branch (Increment)
		ms <= "000";
		wait for 10 ns;
		
		-- Unconditional Branch
		ms <= "001";
		wait for 10 ns;
		
		-- BC (Branch if carry set)
		ms <= "010";
		wait for 10 ns;
		
		-- BV (Branch if overflow set)
		ms <= "011";
		wait for 10 ns;
		
		-- BZ (Branch if zero set)
		ms <= "100";
		wait for 10 ns;
		
		-- BN (Branch if neg set)
		ms <= "101";
		wait for 10 ns;
		
		-- BNC (Branch if carry NOT set)
		ms <= "110";
		wait for 10 ns;
		
		-- BNZ (Branch if zero NOT set)
		ms <= "111";
		wait for 10 ns;

      wait;
   end process;

END;
