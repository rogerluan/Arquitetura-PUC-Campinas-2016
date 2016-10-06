LIBRARY ieee ;
USE ieee.std logic 1164.all ;
USE work.components.all ;

ENTITY swap IS
	PORT ( Data : IN STD LOGIC VECTOR(24 DOWNTO 0) ;
			 Resetn, w : IN STD LOGIC ;
			 Clock, Extern : IN STD LOGIC ;
			 RinExt : IN STD LOGIC VECTOR(1 TO 4) ;
			 BusWires : INOUT STD LOGIC VECTOR(7 DOWNTO 0) ) ;
END swap ;

ARCHITECTURE Behavior OF swapmux IS
	TYPE State type IS (DEFAULT, ADDI, ADD, MOV, MOVI, SUB, SUBI, XCHG) ;
	SIGNAL instruction : State type ;
	SIGNAL count : BUFFER STD LOGIC VECTOR(1 DOWNTO 0) ) ;
	SIGNAL opcode : STD LOGIC VECTOR(2 DOWNTO 0) ;
	SIGNAL Rin, Q : STD LOGIC VECTOR(1 TO 4) ;
	SIGNAL R1, R2, R3, R4 : STD LOGIC VECTOR(7 DOWNTO 0) ;
	
BEGIN
	
	PROCESS ( Resetn, Clock, Data )
	BEGIN
		opcode <= Data(24 DOWNTO 22);
		IF Resetn = ’0’ THEN
			instruction <= DEFAULT ;
		ELSIF (Clock’EVENT AND Clock =’1’) THEN
			CASE opcode IS
				WHEN "001" => --MOVI
					IF w = ’0’ THEN
						instruction <= DEFAULT ;
					ELSE
						instruction <= MOVI ;
					END IF ;
				WHEN "010" => --MOV
					IF w = ’0’ THEN
						instruction <= DEFAULT ;
					ELSE
						instruction <= MOV ;
					END IF ;
				WHEN "011" => --XCHG
					IF w = ’0’ THEN
						instruction <= DEFAULT ;
					ELSE
						instruction <= XCHG ;
					END IF ;
				WHEN "100" => --ADD
					IF w = '0' THEN
						instruction <= DEFAULT ;
					ELSE
						instruction <= ADD ;
					END IF;
				WHEN "101" => --ADDI
					IF w = '0' THEN
						instruction <= DEFAULT ;
					ELSE
						instruction <= ADDI ;
					END IF;
				WHEN "110" => --SUB
					IF w = '0' THEN
						instruction <= DEFAULT ;
					ELSE
						instruction <= SUB ;
					END IF;
				WHEN "111" => --SUBI
					IF w = '0' THEN
						instruction <= DEFAULT ;
					ELSE
						instruction <= SUBI ;
					END IF;
				WHEN OTHERS => instruction <= DEFAULT ; --default
			END CASE ;
		END IF ;
	END PROCESS ;

	PORT MAP ( Resetn, Clock, w, Q ) ;
		Rin(1) <= RinExt(1) OR Q(3) ;
		Rin(2) <= RinExt(2) OR Q(2) ;
		Rin(3) <= RinExt(3) OR Q(1) ;
		reg1: regn PORT MAP ( BusWires, Rin(1), Clock, R1 ) ;
		reg2: regn PORT MAP ( BusWires, Rin(2), Clock, R2 ) ;
		reg3: regn PORT MAP ( BusWires, Rin(3), Clock, R3 ) ;
	muxes:
		WITH Q SELECT
		BusWires <= Data WHEN ”000”,
		R2 WHEN ”100”,
		R1 WHEN ”010”,
		R3 WHEN OTHERS ;
END Behavior ;