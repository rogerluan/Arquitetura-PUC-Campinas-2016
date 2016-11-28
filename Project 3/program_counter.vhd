LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY program_counter IS
	GENERIC ( address_size: INTEGER := 32 );
	PORT ( next_instruction_address: IN STD_LOGIC_VECTOR(address_size-1 DOWNTO 0);
		   clock: IN STD_LOGIC;
		   instruction_address: OUT STD_LOGIC_VECTOR(address_size-1 DOWNTO 0));
END program_counter;

ARCHITECTURE Behavior OF program_counter IS
BEGIN
	PROCESS
	BEGIN
	WAIT UNTIL clock'EVENT AND clock = '1';
		instruction_address <= next_instruction_address;
	END PROCESS;
END Behavior;