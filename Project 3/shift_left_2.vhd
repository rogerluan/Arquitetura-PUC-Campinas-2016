LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shift_left_2 IS
	GENERIC ( N : INTEGER := 32 );
	PORT ( input_data: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		   output_data: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END shift_left_2;

ARCHITECTURE Behavior OF shift_left_2 IS
	SIGNAL temp: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
BEGIN
	output_data <= input_data(N-3 DOWNTO 0) & "00";
END Behavior;