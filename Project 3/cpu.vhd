LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.components.all ;

ENTITY cpu IS
	PORT ( 	Data : IN STD_LOGIC_VECTOR(24 DOWNTO 0) ;
		   	Clock : IN STD_LOGIC;
		   	BusWires : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			r0_stream, r1_stream, r2_stream, r3_stream, rsys_stream, rtemp0_stream, rtemp1_stream  : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			debug_state: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)) ;	-- Used for debugging
END cpu ;

ARCHITECTURE Behavior OF cpu IS
	
BEGIN 

	-- ALU Components	


	-- Pipeline Components


	-- Memory Components


	-- Multiplexors


	-- Controllers




	-- Debugging Variables

END Behavior;