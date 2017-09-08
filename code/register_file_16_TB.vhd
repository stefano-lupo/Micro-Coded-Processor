--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:24:39 02/17/2017
-- Design Name:   
-- Module Name:   U:/CA Register File/RegsiterFile/register_file_16_TB.vhd
-- Project Name:  RegsiterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file_16
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
 
ENTITY register_file_16_TB IS
END register_file_16_TB;
 
ARCHITECTURE behavior OF register_file_16_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file_16
    PORT(
         src : IN  std_logic_vector(1 downto 0);
         des : IN  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         data_src : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         reg0 : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         reg3 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal src : std_logic_vector(1 downto 0) := (others => '0');
   signal des : std_logic_vector(1 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal data_src : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file_16 PORT MAP (
          src => src,
          des => des,
          clk => clk,
          data_src => data_src,
          data => data,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		des <= "00";
		data <= "1010111111111100";
		data_src <= '0';		
		wait for 20 ns;

		des <= "01";
		data <= "1010111111111100";
		data_src <= '0';		
		wait for 20 ns;
		
		des <= "10";
		data <= "1010111111111100";
		data_src <= '0';		
		wait for 20 ns;
		
		des <= "11";
		data <= "1010111111111100";
		data_src <= '0';		
		wait for 20 ns;
		

   end process;

END;
