LIBRARY ieee ;
USE ieee.std logic 1164.all ;
-- Math Libraries
USE ieee.std_logic_arith.all;

ENTITY alu IS
	PORT ( dataSource0, dataSource1 : IN STD LOGIC VECTOR(7 DOWNTO 0);
		   opcode : IN STD LOGIC;
		   dataOutput : OUT STD LOGIC VECTOR(7 DOWNTO 0));
END alu ;

ARCHITECTURE Behavior OF alu IS
BEGIN 
	CASE opcode IS
		WHEN 0 => --SUM
			dataOutput <= dataSource0 + dataSource1;
		WHEN 1 => --SUBTRACTION
			dataOutput <= dataSource0 - dataSource1;
	END CASE;
END Behavior ;