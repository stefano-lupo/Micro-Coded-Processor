LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY instruction_register_TB IS
END instruction_register_TB;
 
ARCHITECTURE behavior OF instruction_register_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruction_register
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         IL : IN  std_logic;
			clock : IN std_logic;
         opCode : OUT  std_logic_vector(7 downto 0);
         destReg : OUT  std_logic_vector(2 downto 0);
         sourceRegA : OUT  std_logic_vector(2 downto 0);
         sourceRegB : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(15 downto 0) := (others => '0');
   signal IL : std_logic := '0';

 	--Outputs
   signal opCode : std_logic_vector(7 downto 0);
   signal destReg : std_logic_vector(2 downto 0);
   signal sourceRegA : std_logic_vector(2 downto 0);
   signal sourceRegB : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	signal clock : std_logic;
	
	
    constant clk_period : time := 20 ns;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instruction_register PORT MAP (
          input => input,
          IL => IL,
          opCode => opCode,
			 clock => clock,
          destReg => destReg,
          sourceRegA => sourceRegA,
          sourceRegB => sourceRegB
        );
	
   -- Clock process definitions
   clk_process :process
   begin
		clock <= '0';
		wait for clk_period/2;
		clock <= '1';
		wait for clk_period/2;
   end process;
		
 

   -- Stimulus process
   stim_proc: process
   begin		

		wait for clk_period/2;
		
		
		-- Example Instruction Loaded from Memory
		input <= "1111111"&"011"&"010"&"001";
		
		-- Dont Load this Instruction yet
		IL <= '0';
		wait for clk_period;
		
		-- Load this instruction
		IL <= '1';
		wait for clk_period;
		
		-- Change Instruction but dont yet load
		IL <= '0';
		input<="1010101"&"111"&"110"&"101";
      wait for clk_period;
		
		-- Now Load it
		IL <= '1';
		wait for clk_period;
		
		wait;
		
   end process;

END;
