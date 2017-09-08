
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY datapath_microcode_TB IS
END datapath_microcode_TB;
 
ARCHITECTURE behavior OF datapath_microcode_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath_microcode
    PORT(
			-- Register File
			a_select			: in std_logic_vector(3 downto 0);		
			b_select			: in std_logic_vector(3 downto 0);		
			dest_select		: in std_logic_vector(3 downto 0);
			rw					: in std_logic;
			clk				: in std_logic;
			
			-- Mux B
			const_in			: in std_logic_vector(15 downto 0);		
			mb					: in std_logic;							
			
			
			-- Functional Unit
			fs_control		: in std_logic_vector(4 downto 0);	
			v					: out std_logic;
			c					: out std_logic;
			n					: out std_logic;
			z					: out std_logic;
			
			-- Memory
			mw					: in std_logic;
			memOut			: out std_logic_vector(15 downto 0);
			
			-- MuxM
			pcNextAddr		: in std_logic_vector(15 downto 0);
			mm					: in std_logic;
			
			-- Mux D
			md					: in std_logic	
        );
    END COMPONENT;
    

   --Inputs
   signal a_select : std_logic_vector(3 downto 0) := (others => '0');
   signal b_select : std_logic_vector(3 downto 0) := (others => '0');
   signal dest_select : std_logic_vector(3 downto 0) := (others => '0');
   signal rw : std_logic := '0';
   signal clk : std_logic := '0';
   signal const_in : std_logic_vector(15 downto 0) := (others => '0');
   signal mb : std_logic := '0';
   signal fs_control : std_logic_vector(4 downto 0) := (others => '0');
   signal mw : std_logic := '0';
	signal pcNextAddr : std_logic_vector(15 downto 0) := (others => '0');
   signal mm : std_logic := '0';
   signal md : std_logic := '0';

 	--Outputs
   signal v : std_logic;
   signal c : std_logic;
   signal n : std_logic;
   signal z : std_logic;
	signal memOut: std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath_microcode PORT MAP (
          a_select => a_select,
          b_select => b_select,
          dest_select => dest_select,
          rw => rw,
          clk => clk,
          const_in => const_in,
          mb => mb,
          fs_control => fs_control,
          v => v,
          c => c,
          n => n,
          z => z,
          mw => mw,
			 memOut => memOut,
			 pcNextAddr => pcNextAddr,
          mm => mm,
          md => md
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
		-- move immediate value into R0
		-- mov R0,#1
		dest_select <= "0000";
		fs_control <= "10000";
		rw <= '1';
		mb <= '1';
		mm <= '0';
		md <= '0';
		const_in <= x"0001";
      wait for clk_period;
		
		-- mov r1, #2 
		dest_select <= "0001";
		fs_control <= "10000";
		rw <= '1';
		mb <= '1';
		mm <= '0';
		md <= '0';
		const_in <= x"0003";
      wait for clk_period;
		
		-- Load value from main memory
		-- ldr r2,[r1]
		dest_select <= "0010";	
		a_select <= "0001";		-- address stored in r1
		fs_control <= "00000";	-- irrelevant
		rw <= '1';					-- save to register
		mb <= '0';					-- not loading constant
		mm <= '0';					-- address coming from A bus
		md <= '1';					-- loading from memory
      wait for clk_period;
		
		-- Perform operation using Func Unit
		-- sub r3,r0,r1				[r3 = 1 - 2 = -1]
		dest_select <= "0011";	-- r3 = dest
		a_select <= "0000";		-- r0 = src a
		b_select <= "0001";		-- r1 = src b
		fs_control <= "00101";	-- subtract
		rw <= '1';					-- save to register
		mb <= '0';					-- not loading constant
		mm <= '0';					-- not loading pcs
		md <= '0';					-- using func unit
      wait for clk_period;

      wait;
   end process;

END;
