
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY control_address_register_TB IS
END control_address_register_TB;
 
ARCHITECTURE behavior OF control_address_register_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_address_register
    PORT(
         clock : IN  std_logic;
         load : IN  std_logic;
         address : IN  std_logic_vector(7 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal load : std_logic := '0';
   signal address : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_address_register PORT MAP (
          clock => clock,
          load => load,
          address => address,
          output => output
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
		wait for clock_period/2;
		
		-- Initialize starting value
		address <=x"00";
		load <= '1';
		wait for clock_period;
		
		-- Address changed, but load not set 
		--	CAR will be incremented instead
		address <= x"0f";
		load <= '0';
		wait for clock_period;
		
		-- CAR now latched previous address
		load <= '1';
		wait for clock_period;
		
		-- Increment as load not set
		load <= '0';
		wait for clock_period;
		
      wait;
   end process;

END;
