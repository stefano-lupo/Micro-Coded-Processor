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
 
ENTITY mux4_16bit_TB IS
END mux4_16bit_TB;
 
ARCHITECTURE behavior OF mux4_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4_16bit
    PORT(
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         in3 : IN  std_logic_vector(15 downto 0);
         s 	 : IN std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal myin0 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin1 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin2 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin3 : std_logic_vector(15 downto 0) := (others => '0');
   signal mys   : std_logic_vector(1 downto 0) := (others => '0');


 	--Outputs
   signal myoutput : std_logic_vector(15 downto 0);
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4_16bit PORT MAP (
          in0 => myin0,
          in1 => myin1,
          in2 => myin2,
          in3 => myin3,
          s => mys,
          output => myoutput
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

		myin0 <= "0000000000000000";
		myin1 <= "0101010101010101";
		myin2 <= "1010101010101010";
		myin3 <= "1111111111111111";

      mys <= "00";
		
		wait for 10 ns;
		mys <= "01";
		
		wait for 10 ns;
		mys <= "10";
		
		wait for 10 ns;
		mys <= "11";

		wait for 10 ns;
		

      -- insert stimulus here 

      --wait;
   end process;

END;
