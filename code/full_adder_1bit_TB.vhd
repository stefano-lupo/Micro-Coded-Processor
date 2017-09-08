--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:16:19 03/06/2017
-- Design Name:   
-- Module Name:   U:/Computer Architecture/Datapath/Datapath/full_added_16bit_TB.vhd
-- Project Name:  RegsiterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder_16bit
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
 
ENTITY full_added_1bit_TB IS
END full_added_1bit_TB;
 
ARCHITECTURE behavior OF full_added_1bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder_1bit
    PORT(
         x : IN  std_logic;
         y : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal y : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder_1bit PORT MAP (
          x => x,
          y => y,
          cin => cin,
          s => s,
          cout => cout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		-- Carry unset
		x <= '1';
		y <= '0';
		cin <= '1';
      wait for 10 ns;	
		
		x <= '1';
		y <= '0';
		cin <= '0';
      wait for 10 ns;
		
		x <= '0';
		y <= '1';
		cin <= '0';
      wait for 10 ns;
		
		x <= '1';
		y <= '1';
		cin <= '0';
      wait for 10 ns;

		wait for 100 ns;

		-- Carry Set
		x <= '0';
		y <= '0';
		cin <= '1';
      wait for 10 ns;	
		
		x <= '1';
		y <= '0';
		cin <= '1';
      wait for 10 ns;
		
		x <= '0';
		y <= '1';
		cin <= '1';
      wait for 10 ns;
		
		x <= '1';
		y <= '1';
		cin <= '1';
      wait for 10 ns;
			

		wait;
   end process;

END;
