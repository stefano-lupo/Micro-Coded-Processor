
-- VHDL Instantiation Created from source file arithmetic_unit.vhd -- 17:11:33 03/14/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT arithmetic_unit
	PORT(
		a : IN std_logic_vector(15 downto 0);
		b : IN std_logic_vector(15 downto 0);
		cin : IN std_logic;
		op_select : IN std_logic_vector(1 downto 0);          
		output : OUT std_logic_vector(15 downto 0);
		cout : OUT std_logic
		);
	END COMPONENT;

	Inst_arithmetic_unit: arithmetic_unit PORT MAP(
		a => ,
		b => ,
		cin => ,
		op_select => ,
		output => ,
		cout => 
	);


