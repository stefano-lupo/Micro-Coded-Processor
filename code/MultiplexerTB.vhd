--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:34:32 02/13/2017
-- Design Name:   
-- Module Name:   U:/CA Register File/RegsiterFile/MultiplexerTB.vhd
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
 
ENTITY MultiplexerTB IS
END MultiplexerTB;
 
ARCHITECTURE behavior OF MultiplexerTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MultiPlexer
    PORT(
         in0 : IN  std_logic_vector(7 downto 0);
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         in3 : IN  std_logic_vector(7 downto 0);
         s : IN  std_logic_vector(1 downto 0);
         z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal TestIn0 : std_logic_vector(7 downto 0) := (others => '0');
   signal TestIn1 : std_logic_vector(7 downto 0) := (others => '0');
   signal TestIn2 : std_logic_vector(7 downto 0) := (others => '0');
   signal TestIn3 : std_logic_vector(7 downto 0) := (others => '0');
   signal TestS : std_logic_vector(1 downto 0) := (others => '0');


 	--Outputs
   signal TestZ : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	-- Hook our multiplexer to our test signals
   uut: MultiPlexer PORT MAP (
          in0 => TestIn0,
          in1 => TestIn1,
          in2 => TestIn2,
          in3 => TestIn3,
          s => TestS,
          z => TestZ
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
	-- Define our test signals
      TestIn0 <= "00000000";
		TestIn1 <= "01010101";
		TestIn2 <= "10101010";
		TestIn3 <= "11111111";
		
	-- Adjust our set signals	
      TestS <= "00";

      wait for 10 ns;	
		TestS <= "01";

      wait for 10 ns;	
		TestS <= "10";

      wait for 10 ns;	
		TestS <= "11";
		
		wait for 10 ns;	
     
 --     wait;
   end process;

END;
