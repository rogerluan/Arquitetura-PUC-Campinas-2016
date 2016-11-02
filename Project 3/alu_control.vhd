LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 

ENTITY alu_control IS
	GENERIC ( N : INTEGER := 32 ) ; 
	PORT ( FUNCT:  IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		   AluOp: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		   AluControl: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
		
END alu_control;

ARCHITECTURE Behavior OF alu_control IS
BEGIN
	PROCESS (AluOp)
	BEGIN 
		CASE AluOp IS
			WHEN "00" => --Load/Store
				AluControl <= "0010"; --SUM
			WHEN "01" => --branch equal
				AluControl <= "0110"; --SUBTRACTION
			WHEN "10" => -- R-Type --The FUNCT field of the instruction determines the ALU operation
				CASE FUNCT IS 
					WHEN "100000" => --SUM
						AluControl <= "0010";
					WHEN "100010" => --SUBTRACTION
						AluControl <= "0110";
					WHEN "100100" => --AND
						AluControl <= "0000";
					WHEN "100101" => --OR
						AluControl <= "0001";
				END CASE;
		END CASE;
	END PROCESS;
END Behavior;