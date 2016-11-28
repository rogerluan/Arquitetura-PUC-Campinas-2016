LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 
use ieee.numeric_std.all;

ENTITY alu_component IS
	GENERIC ( data_size : INTEGER := 32 ) ; 
	PORT ( alu_operand1, alu_operand2:  IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   alu_control: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		   alu_zero_flag: OUT STD_LOGIC;
		   alu_output: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0));
		
END alu_component;

ARCHITECTURE Behavior OF alu_component IS
	SIGNAL alu_output_temp: STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
	--SIGNAL alu_output_integer: INTEGER;
BEGIN
	PROCESS (alu_control)
	BEGIN 
		CASE alu_control IS
			WHEN "0010" => --SUM
				alu_output <= alu_operand1 + alu_operand2;
				alu_zero_flag <= '0';
			WHEN "0110" => --SUBTRACTION
				alu_output_temp <= alu_operand1 - alu_operand2;
				--alu_output_integer <= to_integer(unsigned(alu_output_temp));
				alu_output <= alu_output_temp;
				IF alu_output_temp = 0 THEN
					alu_zero_flag <= '1';
				END IF ;
			WHEN "0000" => --AND
				alu_output <= alu_operand1 AND alu_operand2;
				alu_zero_flag <= '0';
			WHEN "0001" => --OR
				alu_output <= alu_operand1 OR alu_operand2;
				alu_zero_flag <= '0';
			WHEN OTHERS => --defaults to sum, but this must change for future implementations
				alu_output <= alu_operand1 + alu_operand2;
				alu_zero_flag <= '0';
		END CASE;
	END PROCESS;
END Behavior;