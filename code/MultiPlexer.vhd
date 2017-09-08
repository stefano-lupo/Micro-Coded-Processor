----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:05 02/13/2017 
-- Design Name: 
-- Module Name:    MultiPlexer - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MultiPlexer is
	Port(in0,in1,in2,in3: in std_logic_vector(7 downto 0);
			s: in std_logic_vector(1 downto 0);
			z: out std_logic_vector(7 downto 0));
end MultiPlexer;

architecture Behavioral of MultiPlexer is

begin
   process ( s,in0,in1,in2,in3)
		begin
		case  s is
			when "00" => z <= in0;
			when "01" => z <= in1;
			when "10" => z <= in2;
			when "11" => z <= in3;
			when others => z <= in1;
		end case;
	end process;
end Behavioral;

