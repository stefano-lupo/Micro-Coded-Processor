--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:12:30 02/17/2017
-- Design Name:   
-- Module Name:   U:/CA Register File/RegsiterFile/reg_16bit_TB.vhd
-- Project Name:  RegsiterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_16bit
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
 
ENTITY reg_16bit_TB IS
END reg_16bit_TB;
 
ARCHITECTURE behavior OF reg_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_16bit
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal myinput : std_logic_vector(15 downto 0) := (others => '0');
   signal myload : std_logic := '0';
   signal myclk : std_logic := '0';

 	--Outputs
   signal myoutput : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_16bit PORT MAP (
          input => myinput,
          load => myload,
          clk => myclk,
          output => myoutput
        );

   -- Clock process definitions
	clk_process :process
		begin
			myclk <= '0';
			wait for clk_period/2;
			myclk <= '1';
			wait for clk_period/2;
		end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	
      wait for clk_period;	
		myload <= '1';
		myinput <= "1111111111111111";
		
		wait for clk_period;
		myinput <= "1010101010101010";
		
		wait for clk_period;	
		myload <= '0';
		myinput <= "1111111111111111";
		
		wait for clk_period;
		myinput <= "1010101010101010";
		
   end process;

END;
