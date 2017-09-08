-------------------------------------------------------------------
-- MS : 	000 - increment		cnt
--			001 - load				nxt
--			010 - load if c		BC
--			011 - load if v		BV
-- 	 	100 - load if z		BZ
--			101 - load if n		BN
--			110 - load if !c		BNC
--			111 - load if !z		BNZ
-------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity branch_unit is
	Port(
		n : in std_logic;
		z : in std_logic;
		c : in std_logic;
		v : in std_logic;
		ms: in std_logic_vector(2 downto 0);
		output : out std_logic
	);
end branch_unit;

architecture Behavioral of branch_unit is


    component mux8_1bit
    port(
         inputs : IN  std_logic_vector(7 downto 0);
         s : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic
        );
    end component;
	 

	 -- Internal signals
	signal vec		: std_logic_vector(7 downto 0);
	
	
begin

	vec(0) <= '0';
	vec(1) <= '1';
	vec(2) <= c;
	vec(3) <= v;
	vec(4) <= z;
	vec(5) <= n;
	vec(6) <= not(c);
	vec(7) <= not(z);
	
	mux: mux8_1bit port map(
		inputs => vec,
		s => ms,
		output => output
	);

end Behavioral;

