--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:27:16 04/04/2017
-- Design Name:   
-- Module Name:   U:/Computer Architecture/MicroCode/Datapath/microprogram_control_TB.vhd
-- Project Name:  RegsiterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: microprogram_control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY microprogram_control_TB IS
END microprogram_control_TB;
 
ARCHITECTURE behavior OF microprogram_control_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT microprogram_control
    PORT(
         clock : IN  std_logic;
         instructionIn : IN  std_logic_vector(15 downto 0);
         n : IN  std_logic;
         z : IN  std_logic;
         c : IN  std_logic;
         v : IN  std_logic;
         pcNextAddr : OUT  std_logic_vector(15 downto 0);
         destReg : OUT  std_logic_vector(3 downto 0);
         sourceAReg : OUT  std_logic_vector(3 downto 0);
         sourceBReg : OUT  std_logic_vector(3 downto 0);
         sourceBImmediate : OUT  std_logic_vector(15 downto 0);
         mb : OUT  std_logic;
         fsOut : OUT  std_logic_vector(4 downto 0);
         md : OUT  std_logic;
         regFileRW : OUT  std_logic;
         mm : OUT  std_logic;
         mw : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal instructionIn : std_logic_vector(15 downto 0) := (others => '0');
   signal n : std_logic := '0';
   signal z : std_logic := '0';
   signal c : std_logic := '0';
   signal v : std_logic := '0';

 	--Outputs
   signal pcNextAddr : std_logic_vector(15 downto 0);
   signal destReg : std_logic_vector(3 downto 0);
   signal sourceAReg : std_logic_vector(3 downto 0);
   signal sourceBReg : std_logic_vector(3 downto 0);
   signal sourceBImmediate : std_logic_vector(15 downto 0);
   signal mb : std_logic;
   signal fsOut : std_logic_vector(4 downto 0);
   signal md : std_logic;
   signal regFileRW : std_logic;
   signal mm : std_logic;
   signal mw : std_logic;

   -- Clock period definitions
   constant clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: microprogram_control PORT MAP (
          clock => clock,
          instructionIn => instructionIn,
          n => n,
          z => z,
          c => c,
          v => v,
          pcNextAddr => pcNextAddr,
          destReg => destReg,
          sourceAReg => sourceAReg,
          sourceBReg => sourceBReg,
          sourceBImmediate => sourceBImmediate,
          mb => mb,
          fsOut => fsOut,
          md => md,
          regFileRW => regFileRW,
          mm => mm,
          mw => mw
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
	
		n <= '0';
		z <= '0';
		c <= '0';
		v <= '0';

		-- Fetch Instruction (adi r0,#5)
		instructionIn <= "0000010" & "000" & "000" & "101";
		wait for clock_period;
		
		-- PC increments so load next example instruction
		-- Incremenent register a (inc r0)
		instructionIn <= "0000101"&"000"&"000"&"111";
		
		-- Decode instruction - implemented by control memory
		wait for clock_period;
		
		-- Execute last instruction
		wait for clock_period;
		
		-- Load next instruction
		wait for clock_period;
		
		wait;
   end process;

END;
