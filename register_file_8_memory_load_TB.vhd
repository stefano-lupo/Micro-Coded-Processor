LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY register_file_8_memory_load_TB IS
END register_file_8_memory_load_TB;
 
ARCHITECTURE behavior OF register_file_8_memory_load_TB IS 
 
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
		-- This test simulates the loading of a 16 bit hex value into each of the processors seven registers
		
		-- des 		: selects destination register (R0 - R7), by setting the load bit of the desired register
		-- data		: the 16bit hex data coming from memory
		-- data_src	: whether the input data comes from memory, or a source register (0 and 1 respectively)
		
		-- MOV(R0,=0x0)
		des <= "000";			
		data <= x"0000";
		data_src <= '0';		
		wait for clk_period;

		-- MOV(R1,=0x1)
		des <= "001";
		data <= x"0001";
		data_src <= '0';		
		wait for clk_period;
		
		
		-- MOV(R2,=0x2)
		des <= "010";
		data <= x"0002";
		data_src <= '0';		
		wait for clk_period;
		
		
		-- MOV(R3,=0x3)
		des <= "011";
		data <= x"0003";
		data_src <= '0';		
		wait for clk_period;
		
		-- MOV(R4,=0x4)
		des <= "100";
		data <= x"0004";
		data_src <= '0';		
		wait for clk_period;

		-- MOV(R5,=0x5)
		des <= "101";
		data <= x"0005";
		data_src <= '0';		
		wait for clk_period;
		
		
		-- MOV(R6,=0x6)
		des <= "110";
		data <= x"0006";
		data_src <= '0';		
		wait for clk_period;
		
		
		-- MOV(R7,=0x7)
		des <= "111";
		data <= x"0007";
		data_src <= '0';		
		wait for clk_period;
		
		
		wait;

   end process;

END;
