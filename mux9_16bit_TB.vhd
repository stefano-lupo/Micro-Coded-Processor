
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux9_16bit_TB IS
END mux9_16bit_TB;
 
ARCHITECTURE behavior OF mux9_16bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux9_16bit
    PORT(
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         in3 : IN  std_logic_vector(15 downto 0);
         in4 : IN  std_logic_vector(15 downto 0);
         in5 : IN  std_logic_vector(15 downto 0);
         in6 : IN  std_logic_vector(15 downto 0);
         in7 : IN  std_logic_vector(15 downto 0);
         in8 : IN  std_logic_vector(15 downto 0);
         s : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in2 : std_logic_vector(15 downto 0) := (others => '0');
   signal in3 : std_logic_vector(15 downto 0) := (others => '0');
   signal in4 : std_logic_vector(15 downto 0) := (others => '0');
   signal in5 : std_logic_vector(15 downto 0) := (others => '0');
   signal in6 : std_logic_vector(15 downto 0) := (others => '0');
   signal in7 : std_logic_vector(15 downto 0) := (others => '0');
   signal in8 : std_logic_vector(15 downto 0) := (others => '0');
   signal s : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux9_16bit PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          in8 => in8,
          s => s,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
		in0 <= x"0000";
		in1 <= x"0001";
		in2 <= x"0002";
		in3 <= x"0003";
		in4 <= x"0004";
		in5 <= x"0005";
		in6 <= x"0006";
		in7 <= x"0007";
		in8 <= x"0008";
		
		s <= "0000";
		wait for 10 ns;
		
		s <= "0001";
		wait for 10 ns;
		
		s <= "0010";
		wait for 10 ns;
		
		s <= "0011";
		wait for 10 ns;
		
		s <= "0100";
		wait for 10 ns;
		
		s <= "0101";
		wait for 10 ns;
		
		s <= "0110";
		wait for 10 ns;
		
		s <= "0111";
		wait for 10 ns;
		
		s <= "1000";
		wait for 10 ns;
		
		s <= "1010";
		wait for 10 ns;
		s <= "1001";
		wait for 10 ns;

      wait;
   end process;

END;
