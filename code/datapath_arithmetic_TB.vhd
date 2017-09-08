
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY datapath_arithmetic_TB IS
END datapath_arithmetic_TB;
 
ARCHITECTURE behavior OF datapath_arithmetic_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    PORT(
         a_select : IN  std_logic_vector(2 downto 0);
         b_select : IN  std_logic_vector(2 downto 0);
         dest_select : IN  std_logic_vector(2 downto 0);
         write_sig : IN  std_logic;
         clk : IN  std_logic;
         const_in : IN  std_logic_vector(15 downto 0);
         b_source : IN  std_logic;
         fs_control : IN  std_logic_vector(4 downto 0);
         v : OUT  std_logic;
         c : OUT  std_logic;
         n : OUT  std_logic;
         z : OUT  std_logic;
         addr_out : OUT  std_logic_vector(15 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         mem_load : IN  std_logic;
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
   signal a_select : std_logic_vector(2 downto 0) := (others => '0');
   signal b_select : std_logic_vector(2 downto 0) := (others => '0');
   signal dest_select : std_logic_vector(2 downto 0) := (others => '0');
   signal write_sig : std_logic := '0';
   signal clk : std_logic := '0';
   signal const_in : std_logic_vector(15 downto 0) := (others => '0');
   signal b_source : std_logic := '0';
   signal fs_control : std_logic_vector(4 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal mem_load : std_logic := '0';

 	--Outputs
   signal v : std_logic;
   signal c : std_logic;
   signal n : std_logic;
   signal z : std_logic;
   signal addr_out : std_logic_vector(15 downto 0);
   signal data_out : std_logic_vector(15 downto 0);
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);
   signal reg4 : std_logic_vector(15 downto 0);
   signal reg5 : std_logic_vector(15 downto 0);
   signal reg6 : std_logic_vector(15 downto 0);
   signal reg7 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          a_select => a_select,
          b_select => b_select,
          dest_select => dest_select,
          write_sig => write_sig,
          clk => clk,
          const_in => const_in,
          b_source => b_source,
          fs_control => fs_control,
          v => v,
          c => c,
          n => n,
          z => z,
          addr_out => addr_out,
          data_out => data_out,
          data_in => data_in,
          mem_load => mem_load,
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
		


		-- Allow registers to latch data 
		write_sig <= '1';
		
		-- Load inital values into registers
		
		-- mov(r0,#4)
		dest_select <= "000";
		const_in <= x"0004";
		b_source <= '1';
		mem_load <= '0';
		fs_control <= "10000";		-- Use lsr(0) to access B
		wait for clk_period;
		
		-- ldr(r1,=5)
		dest_select <= "001";
		data_in <= x"0005";
		mem_load <= '1';
		fs_control <= "00000";
		wait for clk_period;
		
		
		-- Basic addition of two registers 
		-- add(r2,r0,r1) : r2 = 4 + 5 = 9 = 0x0009
		dest_select <= "010";
		a_select <= "000";
		b_select <= "001";
		b_source <= '0';
		mem_load <= '0';
		fs_control <= "00010";
		wait for clk_period;
		
		-- Basic Subtraction (produces a negative number -> N will be set)
		-- sub(r3,r0,r1)	: r3 = 4 - 5 = -1 = 0xFFFF
		dest_select <= "011";
		a_select <= "000";
		b_select <= "001";
		b_source <= '0';
		mem_load <= '0';
		fs_control <= "00101";
		wait for clk_period;
		
		
		-- Increment operation (produces zero -> Z will be set)
		-- add(r4,r3,#1)	: r4 = -1 + 1 = 0
		dest_select <= "100";
		a_select <= "011";
		b_source <= '0';
		mem_load <= '0';
		fs_control <= "00001";
		wait for clk_period;
			
		
		-- Decrement operation
		-- sub(r5,r1,#1) : r5 = 5 - 1 = 0x0004
		dest_select <= "101";
		a_select <= "001";
		b_source <= '0';
		mem_load <= '0';
		fs_control <= "00110";
		wait for clk_period;
		
		

		-- Load largest positive 16 bit number
		-- ldr(r6,=0x7fff)
		dest_select <= "110";
		data_in <= x"7fff";
		mem_load <= '1';
		fs_control <= "00000";
		wait for clk_period;
		
		
		-- Adding large numbers to produce overflow -> V should be set
		-- add(r7,r6,#1) : r7 =  0x7fff + 1 = 0x8000
		dest_select <= "111";
		a_select <= "110";
		b_source <= '0';
		mem_load <= '0';
		fs_control <= "00001";
		wait for clk_period;
		

      wait;
   end process;

END;
