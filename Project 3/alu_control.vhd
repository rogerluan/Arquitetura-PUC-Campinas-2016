LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 

ENTITY alu_control IS
	GENERIC ( N : INTEGER := 32 ) ; 
	PORT ( funct:  IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		   alu_op: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		   alu_control: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END alu_control;

ARCHITECTURE Behavior OF alu_control IS
BEGIN
	PROCESS (alu_op)
	BEGIN 
		CASE alu_op IS
			WHEN "00" => --Load/Store
				alu_control <= "0010"; --SUM
			WHEN "01" => --branch equal
				alu_control <= "0110"; --SUBTRACTION
			WHEN "10" | "11"=> -- R-Type or I-Type => The funct field of the instruction determines the ALU operation
				CASE funct IS 
					WHEN "100000" => --SUM
						alu_control <= "0010";
					WHEN "100010" => --SUBTRACTION
						alu_control <= "0110";
					WHEN "100100" => --AND
						alu_control <= "0000";
					WHEN "100101" => --OR
						alu_control <= "0001";
					WHEN OTHERS =>
						alu_control <= "0010"; --defaults to sum
				END CASE;
		END CASE;
	END PROCESS;
END Behavior;