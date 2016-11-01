library ieee;
USE ieee.std_logic_1164.all ;

entity multplex_2_1 IS
Port ( Reg1, Reg2:  IN std_logic_vector (0 to 15);
		 Sinal: IN std_logic;
		 RegOut: OUT std_logic_vector (0 to 15));
		
end multplex_2_1;

Architecture mux OF multplex_2_1 IS
Begin
		Process (Sinal)
			Begin
				CASE Sinal IS 
					WHEN '0' =>
						RegOut <= Reg1;
					WHEN '1' =>
						RegOut <= Reg2;
				End CASE;
		END Process;
End mux;