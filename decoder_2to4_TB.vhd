--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:28:51 02/17/2017
-- Design Name:   
-- Module Name:   U:/CA Register File/RegsiterFile/decoder_2to4_TB.vhd
-- Project Name:  RegsiterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder_2to4
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
 
ENTITY decoder_2to4_TB IS
END decoder_2to4_TB;
 
ARCHITECTURE behavior OF decoder_2to4_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_2to4
    PORT(
			a : in std_logic_vector(1 downto 0);
         q0 : OUT  std_logic;
         q1 : OUT  std_logic;
         q2 : OUT  std_logic;
         q3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal mya : std_logic_vector (1 downto 0):= "00";
 

 	--Outputs
   signal myq0 : std_logic;
   signal myq1 : std_logic;
   signal myq2 : std_logic;
   signal myq3 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_2to4 PORT MAP (
          a => mya,
          q0 => myq0,
          q1 => myq1,
          q2 => myq2,
          q3 => myq3
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		mya <= "00";
		wait for 10 ns;
		
		mya <=  "01";
		wait for 10 ns;
		
		mya <=  "10";
		wait for 10 ns;
		
		mya <=  "11";
		wait for 10 ns;
		
   end process;

END;
