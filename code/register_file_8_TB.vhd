LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY register_file_8_TB IS
END register_file_8_TB;
 
ARCHITECTURE behavior OF register_file_8_TB IS 
 
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
		
		des <= "000";
		data <= "0000000000000000";
		data_src <= '0';		
		wait for clk_period;

		des <= "001";
		data <= "0000000000000001";
		data_src <= '0';		
		wait for clk_period;
		
		des <= "010";
		data <= "0000000000000010";
		data_src <= '0';		
		wait for clk_period;
		
		des <= "011";
		data <= "0000000000000011";
		data_src <= '0';		
		wait for clk_period;
		
		des <= "100";
		data <= "0000000000000100";
		data_src <= '0';		
		wait for clk_period;

		des <= "101";
		data <= "0000000000000101";
		data_src <= '0';		
		wait for clk_period;
		
		des <= "110";
		data <= "0000000000000110";
		data_src <= '0';		
		wait for clk_period;
		
		des <= "111";
		data <= "0000000000000111";
		data_src <= '0';		
		wait for clk_period;
		
		
		-- Reset data to 0 and MOV(R0,R7);
		data <= "0000000000000000";
		des <= "000";						-- Selects R0
		src <= "111";						-- Selects R7
		data_src <= '1';					-- Ativates Register transfer on mux2
		wait for clk_period;
		
		wait;

   end process;

END;
