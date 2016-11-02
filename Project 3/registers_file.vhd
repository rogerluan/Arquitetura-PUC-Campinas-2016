LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY registers_file IS
	GENERIC ( data_size, number_of_registers : INTEGER := 32 ) ; 
	PORT ( read_reg1, read_reg2, write_reg: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		   write_data: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   clock, reg_write: IN STD_LOGIC);
		   read_data1, read_data2: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0));
END registers_file;

ARCHITECTURE Behavior OF registers_file IS
	SIGNAL registers: STD_LOGIC_VECTOR(number_of_registers-1 DOWNTO 0);
	SIGNAL reg_number1, reg_number2: INTEGER;
BEGIN
	PROCESS (clock)
	BEGIN
	WAIT UNTIL clock'EVENT;
		CASE (clock) IS
			WHEN '1' => --clock event = rising edge
				IF reg_write = '1' THEN
					reg_number1 <= to_integer(unsigned(write_reg));
					registers(reg_number) <= write_data;
				END IF ;
			WHEN '0' => --clock event = falling edge
				reg_number1 <= to_integer(unsigned(read_reg1));
				read_data1 <= registers(reg_number1);
				reg_number2 <= to_integer(unsigned(read_reg2));
				read_data2 <= registers(reg_number2);
		END CASE;
	END PROCESS;
END Behavior;