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
 
ENTITY decoder_3to8_TB IS
END decoder_3to8_TB;
 
ARCHITECTURE behavior OF decoder_3to8_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_3to8
    PORT(
			a : in std_logic_vector(2 downto 0);
         q : out std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mya : std_logic_vector (2 downto 0):= "000";
 

 	--Outputs
   signal myq : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_3to8 PORT MAP (
          a 	=> mya,
          q	=> myq
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		mya 	<= 	"000";
		wait for 10 ns;
		
		mya 	<=  	"001";
		wait for 10 ns;
		
		mya 	<=  	"010";
		wait for 10 ns;
		
		mya 	<=  	"011";
		wait for 10 ns;
		
		mya 	<=  	"100";
		wait for 10 ns;
		
		mya 	<=  	"101";
		wait for 10 ns;
		
		mya 	<=  	"110";
		wait for 10 ns;
		
		mya 	<=  	"111";
		wait for 10 ns; 
   end process;

END;
