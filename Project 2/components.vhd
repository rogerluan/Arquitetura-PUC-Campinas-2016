LIBRARY ieee ;
USE ieee.std logic 1164.all ;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_textio.all;
USE ieee.numeric_bit.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_unsigned.all;
USE ieee.math_real.all;
USE ieee.math_complex.all;

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
	
	COMPONENT upcount -- State Counter
		PORT ( Clear, Clock : IN STD LOGIC ;
				 Q : BUFFER STD LOGIC VECTOR(1 DOWNTO 0) ) ;
	END COMPONENT ;
	
END components ;