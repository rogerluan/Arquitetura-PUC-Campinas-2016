LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.components.all ;

ENTITY cpu IS
	PORT ( Data : IN STD_LOGIC_VECTOR(24 DOWNTO 0) ;
		   Clock : IN STD_LOGIC;
		   BusWires : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		   r0_stream, r1_stream, r2_stream, r3_stream, rsys_stream, rtemp0_stream, rtemp1_stream  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)) ;	-- Used for debugging
END cpu ;

ARCHITECTURE Behavior OF cpu IS
	SIGNAL Rin, Rout, Q : STD_LOGIC_VECTOR(1 TO 3) ;
	SIGNAL r0_data, r1_data, r2_data, r3_data, rsys_data, rtemp0_data, rtemp1_data : STD_LOGIC_VECTOR(7 DOWNTO 0) ;

	SIGNAL Imedout, Rsysin, Rsysout, ALU : STD_LOGIC;
	SIGNAL Rtempin, Rtempout : STD_LOGIC_VECTOR(0 TO 1);
	SIGNAL Rin, Rout : STD_LOGIC_VECTOR(0 TO 3);
	
BEGIN 

	-- Unit Control
	uc: 		uc PORT MAP ( Data, Clock, Imedout, Rin, Rout, Rtempin, Rtempout, Rsysin, Rsysout, ALU );

	-- ALU
	alu:		alu PORT MAP ( rtemp0_data, BusWires, ALU, rtemp1_data );

	-- Registers
	reg0: 		regn PORT MAP ( BusWires, Rin(0), Clock, r0_data ) ;
	reg1: 		regn PORT MAP ( BusWires, Rin(1), Clock, r1_data ) ;
	reg2: 		regn PORT MAP ( BusWires, Rin(2), Clock, r2_data ) ;
	reg3: 		regn PORT MAP ( BusWires, Rin(3), Clock, r3_data ) ;
	regsys: 	regn PORT MAP ( BusWires, Rsysin, Clock, rsys_data ) ;
	regtemp0:	regn PORT MAP ( BusWires, Rtempin(0), Clock, rtemp0_data ) ;
	regtemp1: 	regn PORT MAP ( BusWires, Rtempin(1), Clock, rtemp1_data ) ;

	-- Tri-States
	tri_imed: 	trin PORT MAP ( Data(15 DOWNTO 0), Imedout, BusWires ) ;
	tri_r0: 	trin PORT MAP ( r0_data, Rout(0), BusWires ) ;
	tri_r1: 	trin PORT MAP ( r1_data, Rout(1), BusWires ) ;
	tri_r2: 	trin PORT MAP ( r2_data, Rout(2), BusWires ) ;
	tri_r3: 	trin PORT MAP ( r3_data, Rout(3), BusWires ) ;
	tri_rsys: 	trin PORT MAP ( rsys_data, Rsysout, BusWires ) ;
	tri_rtemp0: trin PORT MAP ( rtemp0_data, Rtempout(0), BusWires ) ;
	tri_rtemp1: trin PORT MAP ( rtemp1_data, Rtempout(1), BusWires ) ;

	r0_stream <= r0_data;
	r1_stream <= r1_data;
	r2_stream <= r2_data;
	r3_stream <= r3_data;
	rsys_stream <= rsys_data;
	rtemp0_stream <= rtemp0_data;
	rtemp1_stream <= rtemp1_data;

END Behavior ;