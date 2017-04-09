--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:23:45 02/13/2017
-- Design Name:   
-- Module Name:   U:/CA Register File/RegsiterFile/MyTestBench.vhd
-- Project Name:  RegsiterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MultiPlexer
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
 
ENTITY MyTestBench IS
END MyTestBench;
 
ARCHITECTURE behavior OF MyTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MultiPlexer
    PORT(
         in0 : IN  std_logic_vector(7 downto 0);
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         in3 : IN  std_logic_vector(7 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(7 downto 0) := (others => '0');
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal in2 : std_logic_vector(7 downto 0) := (others => '0');
   signal in3 : std_logic_vector(7 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MultiPlexer PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          s0 => s0,
          s1 => s1,
          z => z
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		in0 <= "1010101010101010";
		in1 <= "1100110011001100";
		in2 <= "1111000011110000";
		in3 <= "1111111100000000";
      wait for 10 ns;	
      s <= "00";

      wait for 10 ns;	
		s <= "01";

      wait for 10 ns;	
		s <= "10";

      wait for 10 ns;	
		s <= "11";
     

      wait;
   end process;

END;
