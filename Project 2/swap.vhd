LIBRARY ieee ;
USE ieee.std logic 1164.all ;
USE work.components.all ;

ENTITY swap IS
	PORT ( Data : IN STD LOGIC VECTOR(7 DOWNTO 0) ;
			 Resetn, w : IN STD LOGIC ;
			 Clock, Extern : IN STD LOGIC ;
			 RinExt : IN STD LOGIC VECTOR(1 TO 3) ;
			 BusWires : INOUT STD LOGIC VECTOR(7 DOWNTO 0) ) ;
END swap ;

ARCHITECTURE Behavior OF swap IS
	SIGNAL Rin, Rout, Q : STD LOGIC VECTOR(1 TO 3) ;
	SIGNAL R1, R2, R3 : STD LOGIC VECTOR(7 DOWNTO 0) ;
	
BEGIN 
	control: shiftr GENERIC MAP ( K => 3 ) PORT MAP ( Resetn, Clock, w, Q ) ;
	-- Register input
	Rin(1) <= RinExt(1) OR Q(3) ;
	Rin(2) <= RinExt(2) OR Q(2) ;
	Rin(3) <= RinExt(3) OR Q(1) ;
	-- Register output
	Rout(1) <= Q(2) ;
	Rout(2) <= Q(1) ; 
	Rout(3) <= Q(3) ;
	--	Tri-state buffer
	tri ext: trin PORT MAP ( Data, Extern, BusWires ) ;
	-- call of the register
	reg1: regn PORT MAP ( BusWires, Rin(1), Clock, R1 ) ;
	reg2: regn PORT MAP ( BusWires, Rin(2), Clock, R2 ) ;
	reg3: regn PORT MAP ( BusWires, Rin(3), Clock, R3 ) ;
	-- call of the tri-state
	tri1: trin PORT MAP ( R1, Rout(1), BusWires ) ;
	tri2: trin PORT MAP ( R2, Rout(2), BusWires ) ;
	tri3: trin PORT MAP ( R3, Rout(3), BusWires ) ;
	-- missing ULA
	
	
END Behavior ;
