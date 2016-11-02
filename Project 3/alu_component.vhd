LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 

ENTITY alu_component IS
	GENERIC ( N : INTEGER := 32 ) ; 
	PORT ( AluOperand0, AluOperand1:  IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		   AluControl: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		   AluZeroFlag: OUT STD_LOGIC;
		   AluOutput: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
		
END alu_component;

ARCHITECTURE Behavior OF alu_component IS
BEGIN
	PROCESS (AluControl)
	BEGIN 
		CASE AluControl IS
			WHEN "0010" => --SUM
				dataOutput <= dataSource0 + dataSource1;
				AluZeroFlag <= '0';
			WHEN "0110" => --SUBTRACTION
				dataOutput <= dataSource0 - dataSource1;
				IF dataOutput = '0' THEN
					AluZeroFlag <= '1';
				END IF ;
			WHEN "0000" => --AND
				dataOutput <= dataSource0 AND dataSource1;
				AluZeroFlag <= '0';
			WHEN "0001" => --OR
				dataOutput <= dataSource0 OR dataSource1;
				AluZeroFlag <= '0';
		END CASE;
	END PROCESS;
END Behavior;