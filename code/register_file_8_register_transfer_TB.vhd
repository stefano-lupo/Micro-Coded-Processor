LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY register_file_8_register_transfer_TB IS
END register_file_8_register_transfer_TB;
 
ARCHITECTURE behavior OF register_file_8_register_transfer_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT register_file_8
    PORT(
         src : IN  std_logic_vector(2 downto 0);
         des : IN  std_logic_vector(2 downto 0);
         clk : IN  std_logic;
         data_src : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         reg0 : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         reg3 : OUT  std_logic_vector(15 downto 0);
			reg4 : OUT  std_logic_vector(15 downto 0);
         reg5 : OUT  std_logic_vector(15 downto 0);
         reg6 : OUT  std_logic_vector(15 downto 0);
         reg7 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal src : std_logic_vector(2 downto 0) := (others => '0');
   signal des : std_logic_vector(2 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal data_src : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);
	signal reg4 : std_logic_vector(15 downto 0);
   signal reg5 : std_logic_vector(15 downto 0);
   signal reg6 : std_logic_vector(15 downto 0);
   signal reg7 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file_8 PORT MAP (
          src => src,
          des => des,
          clk => clk,
          data_src => data_src,
          data => data,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
			 reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7
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
		-- This test simulates the transfering of a 16 bit hex value from one register to another
		
		-- src		: selects the source register (R0 - R7)
		-- des 		: selects destination register (R0 - R7), by setting the load bit of the desired register
		-- data		: the 16bit hex data coming from memory
		-- data_src	: whether the input data comes from memory, or a source register (0 and 1 respectively)
		
		
		-- Load initial 16bit hex value from memory into R0
		-- MOV(R0,=0x1234)
		des <= "000";			
		data <= x"1234";
		data_src <= '0';		
		
		wait for clk_period;
		
		-- Reset data to 0 to show it the data is NOT coming from memory
		data <= "0000000000000000";
		
		
		-- MOV(R1,R0)
		des <= "001";						-- Selects R1
		src <= "000";						-- Selects R0
		data_src <= '1';					-- Activate Register transfer mode
		wait for clk_period;

		-- MOV(R2,R1)
		des <= "010";						-- Selects R2
		src <= "001";						-- Selects R1
		data_src <= '1';					-- Activate Register transfer mode
		wait for clk_period;
		
		
		-- MOV(R3,R2)
		des <= "011";						-- Selects R3
		src <= "010";						-- Selects R2
		data_src <= '1';					-- Activate Register transfer mode
		wait for clk_period;
		
		
		-- MOV(R4,R3)
		des <= "100";						-- Selects R4
		src <= "011";						-- Selects R3
		data_src <= '1';					-- Activate Register transfer mode
		wait for clk_period;
		
		-- MOV(R5,R4)
		des <= "101";						-- Selects R5
		src <= "100";						-- Selects R4
		data_src <= '1';					-- Activate Register transfer mode
		wait for clk_period;

		-- MOV(R6,R5)
		des <= "110";						-- Selects R6
		src <= "101";						-- Selects R5
		data_src <= '1';					-- Activate Register transfer mode
		wait for clk_period;
		
		
		-- MOV(R7,R6)
		des <= "111";						-- Selects R7
		src <= "110";						-- Selects R6
		data_src <= '1';					-- Activate Register transfer mode
		wait for clk_period;
			
		wait;

   end process;

END;
