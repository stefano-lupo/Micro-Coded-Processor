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
 
ENTITY mux8_16bit_TB IS
END mux8_16bit_TB;
 
ARCHITECTURE behavior OF mux8_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8_16bit
    PORT(
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
			in3 : IN  std_logic_vector(15 downto 0);
         in4 : IN  std_logic_vector(15 downto 0);
         in5 : IN  std_logic_vector(15 downto 0);
         in6 : IN  std_logic_vector(15 downto 0);
			in7 : IN  std_logic_vector(15 downto 0);
         s 	 : IN std_logic_vector(2 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal myin0 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin1 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin2 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin3 : std_logic_vector(15 downto 0) := (others => '0');
	signal myin4 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin5 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin6 : std_logic_vector(15 downto 0) := (others => '0');
   signal myin7 : std_logic_vector(15 downto 0) := (others => '0');
   signal mys   : std_logic_vector(2 downto 0) := (others => '0');


 	--Outputs
   signal myoutput : std_logic_vector(15 downto 0);
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8_16bit PORT MAP (
          in0 => myin0,
          in1 => myin1,
          in2 => myin2,
          in3 => myin3,
			 in4 => myin4,
          in5 => myin5,
          in6 => myin6,
          in7 => myin7,
          s => mys,
          output => myoutput
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

		myin0 <= "0000000000000000";
		myin1 <= "0000000000000001";
		myin2 <= "0000000000000010";
		myin3 <= "0000000000000011";
		myin4 <= "0000000000000100";
		myin5 <= "0000000000000101";
		myin6 <= "0000000000000110";
		myin7 <= "0000000000000111";

      mys <= "000";
		
		wait for 10 ns;
		mys <= "001";
		
		wait for 10 ns;
		mys <= "010";
		
		wait for 10 ns;
		mys <= "011";

		wait for 10 ns;
		mys <= "100";
		
		wait for 10 ns;
		mys <= "101";
		
		wait for 10 ns;
		mys <= "110";
		
		wait for 10 ns;
		mys <= "111";

		wait for 10 ns;
		
   end process;

END;
