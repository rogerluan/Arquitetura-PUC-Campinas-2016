LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY if_id IS
	GENERIC ( address_size, instruction_size : INTEGER := 32 ) ; 
	PORT ( next_address_input: IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   instruction_input: IN STD_LOGIC_VECTOR (instruction_size-1 DOWNTO 0);
		   clock: IN STD_LOGIC;
		   next_address_output: OUT STD_LOGIC_VECTOR (address_size-1 DOWNTO 0)
		   instruction_output: OUT STD_LOGIC_VECTOR (instruction_size-1 DOWNTO 0));
END if_id;

ARCHITECTURE Behavior OF if_id IS
BEGIN
	PROCESS
	BEGIN
	WAIT UNTIL clock'EVENT AND clock = '1';
		next_address_output <= next_address_input;
		instruction_output <= instruction_input;
	END PROCESS;
END Behavior;