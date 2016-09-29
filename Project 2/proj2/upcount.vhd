LIBRARY ieee ;
USE ieee.std logic 1164.all ;
USE ieee.std logic unsigned.all ;

ENTITY upcount IS
	PORT ( Clear, Clock : IN STD LOGIC ;
			 Q : BUFFER STD LOGIC VECTOR(1 DOWNTO 0) ) ;
END upcount ;

ARCHITECTURE Behavior OF upcount IS
BEGIN
	upcount: PROCESS ( Clock )
	BEGIN
	IF (Clock’EVENT AND Clock = ’1’) THEN
		IF Clear = ’1’ THEN
			Q <= ”00” ;
		ELSE
			Q <= Q + ’1’ ;
		END IF ;
	END IF;
	END PROCESS;
END Behavior ;