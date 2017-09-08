----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:34 02/17/2017 
-- Design Name: 
-- Module Name:    decoder_2to4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decoder_2to4 is
	Port( a 	: in std_logic_vector(1 downto 0);
			q0 : out std_logic;
			q1 : out std_logic;
			q2 : out std_logic;
			q3 : out std_logic
		  );
end decoder_2to4;

architecture Behavioral of decoder_2to4 is

begin
	q0 <= ((not a(0)) and (not a(1))) after 5ns;
	q1 <= (a(0) and (not a(1))) after 5ns;
	q2 <= ((not a(0)) and a(1)) after 5ns;
	q3 <= (a(0) and a(1)) after 5ns;
--	q0 <= ((not a1) and (not a0)) after 5ns;
--	q1 <= (a1 and (not a0)) after 5ns;
--	q2 <= ((not a1) and a0) after 5ns;
--	q3 <= (a1 and a0) after 5ns;
end Behavioral;

