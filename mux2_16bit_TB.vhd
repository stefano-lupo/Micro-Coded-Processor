--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:41:05 02/13/2017
-- Design Name:   
-- Module Name:   U:/CA Register File/RegsiterFile/mux4_16bit_TB.vhd
-- Project Name:  RegsiterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux4_16bit
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
 
ENTITY mux2_16bit_TB IS
END mux2_16bit_TB;
 
ARCHITECTURE behavior OF mux2_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2_16bit
    PORT(
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         s 	 : IN std_logic;
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal myin0 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin1 : std_logic_vector(15 downto 0) := (others => '0');
   signal mys   : std_logic;


 	--Outputs
   signal myoutput : std_logic_vector(15 downto 0);
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_16bit PORT MAP (
          in0 => myin0,
          in1 => myin1,
          s => mys,
          output => myoutput
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

		myin0 <= "0000000000000000";
		myin1 <= "1111111111111111";

      mys <= '0';
		
		wait for 5 ns;
		mys <= '1';

		wait for 5 ns;
		
		end process;

END;
