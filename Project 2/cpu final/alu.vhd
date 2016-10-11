LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 
 
ENTITY alu IS
	PORT ( dataSource0, dataSource1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		   opcode : IN STD_LOGIC;
		   dataOutput : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END alu ;

ARCHITECTURE Behavior OF alu IS
BEGIN
PROCESS (opcode)
BEGIN 
	CASE opcode IS
		WHEN '0' => --SUM
			dataOutput <= dataSource0 + dataSource1;
		WHEN '1' => --SUBTRACTION
			dataOutput <= dataSource0 - dataSource1;
	END CASE;
END PROCESS;
END Behavior ;