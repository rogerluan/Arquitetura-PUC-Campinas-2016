LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY mux2to1 IS
	GENERIC ( N : INTEGER := 32 ) ; 
	PORT ( mux_source0, mux_source1:  IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		   mux_control: IN STD_LOGIC;
		   mux_output: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END mux2to1;

ARCHITECTURE Behavior OF mux2to1 IS
BEGIN
	PROCESS (mux_control)
	BEGIN
		CASE mux_control IS 
			WHEN '0' =>
				mux_output <= mux_source0;
			WHEN '1' =>
				mux_output <= mux_source1;
		END CASE;
	END PROCESS;
END Behavior;