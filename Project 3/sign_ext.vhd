LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY sign_ext IS
	PORT ( SignExtInput:  IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		   SignExtOutput: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END sign_ext;

ARCHITECTURE Behavior OF sign_ext IS
BEGIN
	SignExtOutput <= STD_LOGIC_VECTOR(resize(signed(SignExtInput), SignExtOutput'length));
END Behavior;