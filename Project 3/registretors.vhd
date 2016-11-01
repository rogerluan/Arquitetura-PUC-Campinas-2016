LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

Entity registretors IS
		GENERIC ( N : INTEGER := 16 ) ;
		PORT ( RegisRead1, RegisRead2, RegisWrite, WriteData : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			RegWriteSignal: IN STD_LOGIC_VECTOR (2 DOWNTO 0) ;
			ReadData1, ReadData2 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
END registretors;

ARCHITECTURE Behavior OF registretors IS
	Begin
		PROCESS
			BEGIN
				
END Behavior;