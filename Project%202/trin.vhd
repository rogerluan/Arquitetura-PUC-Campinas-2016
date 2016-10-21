LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY trin IS
	GENERIC ( N : INTEGER := 16 ) ;
	PORT ( X : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			 E : IN STD_LOGIC ;
			 F : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
END trin ;

ARCHITECTURE Behavior OF trin IS
	BEGIN
		F <= (OTHERS => 'Z') WHEN E = '0' ELSE X ;
END Behavior ;