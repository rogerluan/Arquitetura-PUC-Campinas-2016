LIBRARY ieee ;
USE ieee.std logic 1164.all ;

PACKAGE components IS

	COMPONENT regn -- register
		GENERIC ( N : INTEGER := 8 ) ;
		PORT ( R : IN STD LOGIC VECTOR(N−1 DOWNTO 0) ;
				 Rin, Clock : IN STD LOGIC ;
				 Q : OUT STD LOGIC VECTOR(N−1 DOWNTO 0) ) ;
	END COMPONENT ;
	
	COMPONENT trin -- tri-state buffers
		GENERIC ( N : INTEGER := 8 ) ;
		PORT ( X : IN STD LOGIC VECTOR(N−1 DOWNTO 0) ;
				 E : IN STD LOGIC ;
				 F : OUT STD LOGIC VECTOR(N−1 DOWNTO 0) ) ;
	END COMPONENT ;

	COMPONENT uc -- Unit Control
		PORT ( 	Data : IN STD LOGIC VECTOR(24 DOWNTO 0) ;
			   	Clock: IN STD LOGIC ;
				Imedout : OUT STD LOGIC ;
				Rin : OUT STD LOGIC VECTOR(0 TO 3) ;
				Rout : OUT STD LOGIC VECTOR(0 TO 3) ;
				Rtempin : OUT STD LOGIC VECTOR(0 TO 1) ;
				Rtempout : OUT STD LOGIC VECTOR(0 TO 1) ;
				Rsysin : OUT STD LOGIC ;
				Rsysout : OUT STD LOGIC ;
				ULA : OUT STD LOGIC ) ;
	END COMPONENT;

	COMPONENT alu -- arithmetic logical unit
		PORT (  dataSource0, dataSource1 : IN STD LOGIC VECTOR(7 DOWNTO 0);
		   		opcode : IN STD LOGIC;
		   		dataOutput : OUT STD LOGIC VECTOR(7 DOWNTO 0));
	END COMPONENT ;
	
END components ;