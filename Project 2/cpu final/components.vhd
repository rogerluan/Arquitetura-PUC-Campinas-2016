LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 

PACKAGE components IS

	COMPONENT alu_component -- arithmetic logical unit
		PORT (  dataSource0, dataSource1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		   		opcode : IN STD_LOGIC;
		   		dataOutput : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT ;

	COMPONENT regn -- register
		GENERIC ( N : INTEGER := 16 ) ;
		PORT ( R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				 Rin, Clock : IN STD_LOGIC ;
				 Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
	END COMPONENT ;
	
	COMPONENT trin -- tri-state buffers
		GENERIC ( N : INTEGER := 16 ) ;
		PORT ( X : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				 E : IN STD_LOGIC ;
				 F : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
	END COMPONENT ;

	COMPONENT uc -- Unit Control
		PORT ( 	Data : IN STD_LOGIC_VECTOR(24 DOWNTO 0) ;
			   	Clock: IN STD_LOGIC ;
				Imedout : OUT STD_LOGIC ;
				Rin : OUT STD_LOGIC_VECTOR(0 TO 3) ;
				Rout : OUT STD_LOGIC_VECTOR(0 TO 3) ;
				Rtempin : OUT STD_LOGIC_VECTOR(0 TO 1) ;
				Rtempout : OUT STD_LOGIC_VECTOR(0 TO 1) ;
				Rsysin : OUT STD_LOGIC ;
				Rsysout : OUT STD_LOGIC ;
				ULA : OUT STD_LOGIC );
	END COMPONENT;
	
END components ;