----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:04 02/13/2017 
-- Design Name: 
-- Module Name:    mux4_16bit - Behavioral 
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

entity mux4_16bit is
	Port(	in0,in1,in2,in3 : in std_logic_vector(15 downto 0);
			s : in std_logic_vector(1 downto 0);
			output : out std_logic_vector(15 downto 0));
end mux4_16bit;

architecture Behavioral of mux4_16bit is
begin
--	with s select
--	output <= 	in0 after 5ns when "00",
--					in1 after 5ns when "01",
--					in2 after 5ns when "10",
--					in3 after 5ns when "11",
--					in3 after 5ns when others;
   process ( s,in0,in1,in2,in3)
		begin
		case  s is
			when "00" => output <= in0;
			when "01" => output <= in1;
			when "10" => output <= in2;
			when "11" => output <= in3;
			when others => output <= in1;
		end case;
	end process;
end Behavioral;

