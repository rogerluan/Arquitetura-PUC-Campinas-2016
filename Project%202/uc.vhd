LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.components.all ;
USE ieee.std_logic_arith;

ENTITY uc IS
	PORT ( 	Data : IN STD_LOGIC_VECTOR(24 DOWNTO 0) ;
		   	Clock: IN STD_LOGIC ;
			Imedout : OUT STD_LOGIC ;
			Rin : OUT STD_LOGIC_VECTOR(0 TO 3) ;
			Rout : OUT STD_LOGIC_VECTOR(0 TO 3) ;
			Rtempin : OUT STD_LOGIC_VECTOR(0 TO 1) ;
			Rtempout : OUT STD_LOGIC_VECTOR(0 TO 1) ;
			Rsysin : OUT STD_LOGIC ;
			Rsysout : OUT STD_LOGIC ;
			ALU : OUT STD_LOGIC ) ;
END uc ;

ARCHITECTURE Behavior OF uc_state_machine IS
	TYPE States IS (DECODE, 
						MOVI, 
						MOV, 
						XCHG_1, XCHG_2, XCHG_3,
						ARITH_IN, ARITH_OUT,
						ADD, ADDI, SUB, SUBI) ;
	SIGNAL state : States ;
	SIGNAL instruction : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL regSource, regTarget, regDest : STD_LOGIC_VECTOR (1 DOWNTO 0);
BEGIN
	PROCESS (Clock)
	BEGIN
		IF (Clock'EVENT AND Clock ='1') THEN
			CASE state IS
				WHEN DECODE =>x
					instruction <= Data(24 DOWNTO 22) ;
					CASE instruction IS
						WHEN "001" => --MOVI
							state <= MOVI;
						WHEN "010" => --MOV
							state <= MOV;
						WHEN "011" => --XCHG
							state <= XCHG_1;
						WHEN "100" | "101" | "110" | "111" => --ARITHMETICS
							state <= ARITH_IN;
						WHEN OTHERS => --No changes
							state <= DECODE; 
					END CASE;

					--Every signal is zero
					Imedout <= '0';
					Rin <= "0000";
					Rout <= "0000";
					Rtempin <= "00";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';
					ALU <= '0';

				WHEN MOVI =>
					regDest <= Data(21 DOWNTO 20);
					Rin <= "0000";
					CASE regDest IS
						WHEN "00" =>
							Rin(0) <= '1';
						WHEN "01" =>
							Rin(1) <= '1';
						WHEN "10" =>
							Rin(2) <= '1';
						WHEN "11" =>
							Rin(3) <= '1';
					END CASE;
					Imedout <= '1';

					--Zero all the rest
					Rout <= "0000";
					Rtempin <= "00";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';
					ALU <= '0';

					--Sets the next state
					state <= DECODE;

				WHEN MOV =>
					regDest <= Data(21 DOWNTO 20);
					regSource <= Data(19 DOWNTO 18);
					Rin <= "0000";
					CASE regDest IS
						WHEN "00" =>
							Rin(0) <= '1';
						WHEN "01" =>
							Rin(1) <= '1';
						WHEN "10" =>
							Rin(2) <= '1';
						WHEN "11" =>
							Rin(3) <= '1';
					END CASE;
					Rout <= "0000";
					CASE regSource IS
						WHEN "00" =>
							Rout(0) <= '1';
						WHEN "01" =>
							Rout(1) <= '1';
						WHEN "10" =>
							Rout(2) <= '1';
						WHEN "11" =>
							Rout(3) <= '1';
					END CASE;

					--Zero all the rest
					Imedout <= '0';
					Rtempin <= "00";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';
					ALU <= '0';

					--Sets the next state
					state <= DECODE;

				WHEN XCHG_1 =>
					regSource <= Data(21 DOWNTO 20); --First register in XCHG call
					Rout <= "0000";
					CASE regSource IS
						WHEN "00" =>
							Rout(0) <= '1';
						WHEN "01" =>
							Rout(1) <= '1';
						WHEN "10" =>
							Rout(2) <= '1';
						WHEN "11" =>
							Rout(3) <= '1';
					END CASE;
					Rsysin <= '1';

					--Zero all the rest
					Imedout <= '0';
					Rin <= "0000";
					Rtempin <= "00";
					Rtempout <= "00";
					Rsysout <= '0';
					ALU <= '0';

					--Sets the next state
					state <= XCHG_2;

				WHEN XCHG_2 =>
					regDest <= Data(21 DOWNTO 20); --First register in XCHG call
					regSource <= Data(19 DOWNTO 18); --Second register in XCHG call
					Rout <= "0000";
					CASE regSource IS
						WHEN "00" =>
							Rout(0) <= '1';
						WHEN "01" =>
							Rout(1) <= '1';
						WHEN "10" =>
							Rout(2) <= '1';
						WHEN "11" =>
							Rout(3) <= '1';
					END CASE;
					Rin <= "0000";
					CASE regDest IS
						WHEN "00" =>
							Rin(0) <= '1';
						WHEN "01" =>
							Rin(1) <= '1';
						WHEN "10" =>
							Rin(2) <= '1';
						WHEN "11" =>
							Rin(3) <= '1';
					END CASE;

					--Zero all the rest
					Imedout <= '0';
					Rtempin <= "00";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';
					ALU <= '0';

					--Sets the next state
					state <= XCHG_3;

				WHEN XCHG_3 =>
					regDest <= Data(19 DOWNTO 18); --Second register in XCHG call
					Rin <= "0000";
					CASE regDest IS
						WHEN "00" =>
							Rin(0) <= '1';
						WHEN "01" =>
							Rin(1) <= '1';
						WHEN "10" =>
							Rin(2) <= '1';
						WHEN "11" =>
							Rin(3) <= '1';
					END CASE;
					Rsysout <= '1';

					--Zero all the rest
					Imedout <= '0';
					Rout <= "0000";
					Rtempin <= "00";
					Rtempout <= "00";
					Rsysin <= '0';
					ALU <= '0';

					--Sets the next state
					state <= DECODE;

				WHEN ARITH_IN =>
					regSource <= Data(19 DOWNTO 18); --Second register in ARITH call
					Rout <= "0000";
					CASE regSource IS
						WHEN "00" =>
							Rout(0) <= '1';
						WHEN "01" =>
							Rout(1) <= '1';
						WHEN "10" =>
							Rout(2) <= '1';
						WHEN "11" =>
							Rout(3) <= '1';
					END CASE;
					Rtempin <= "01"; --Opens the IN stream in TEMP1 register

					--Zero all the rest
					Imedout <= '0';
					Rin <= "0000";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';
					ALU <= '0';

					--Sets the next state
					CASE instruction IS
						WHEN "100" => 
							state <= ADD;
						WHEN "101" =>
							state <= ADDI;
						WHEN "110" =>
							state <= SUB;
						WHEN "111" => 
							state <= SUBI;
						WHEN OTHERS =>
							state <= DECODE; --an error occurred
					END CASE;

				WHEN ARITH_OUT =>
					regDest <= Data(21 DOWNTO 20); --First register in ARITH call
					Rin <= "0000";
					CASE regDest IS
						WHEN "00" =>
							Rin(0) <= '1';
						WHEN "01" =>
							Rin(1) <= '1';
						WHEN "10" =>
							Rin(2) <= '1';
						WHEN "11" =>
							Rin(3) <= '1';
					END CASE;
					Rtempout <= "10"; --Opens the OUT stream in TEMP2 register

					--Zero all the rest
					Imedout <= '0';
					Rout <= "0000";
					Rtempin <= "00";
					Rsysin <= '0';
					Rsysout <= '0';
					ALU <= '0';

					--Sets the next state
					state <= ARITH_OUT;

				WHEN ADD =>
					regTarget <= Data(17 DOWNTO 16); --Third register in ARITH call
					Rout <= "0000";
					CASE regTarget IS
						WHEN "00" =>
							Rout(0) <= '1';
						WHEN "01" =>
							Rout(1) <= '1';
						WHEN "10" =>
							Rout(2) <= '1';
						WHEN "11" =>
							Rout(3) <= '1';
					END CASE;
					Rtempin <= "10"; --Opens the IN stream in TEMP2 register
					ALU <= '0'; --This should be the signal for SUM

					--Zero all the rest
					Imedout <= '0';
					Rin <= "0000";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';

					--Sets the next state
					state <= ARITH_OUT;

				WHEN ADDI =>
					Imedout <= '1';
					Rtempin <= "10"; --Opens the IN stream in TEMP2 register
					ALU <= '0'; --This should be the signal for SUM

					--Zero all the rest
					Rin <= "0000";
					Rout <= "0000";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';

					--Sets the next state
					state <= ARITH_OUT;

				WHEN SUB => 
					regTarget <= Data(17 DOWNTO 16); --Third register in ARITH call
					Rout <= "0000";
					CASE regTarget IS
						WHEN "00" =>
							Rout(0) <= '1';
						WHEN "01" =>
							Rout(1) <= '1';
						WHEN "10" =>
							Rout(2) <= '1';
						WHEN "11" =>
							Rout(3) <= '1';
					END CASE;
					Rtempin <= "10"; --Opens the IN signal in TEMP2 register
					ALU <= '1'; --This should be the signal for SUBTRACTION

					--Zero all the rest
					Imedout <= '0';
					Rin <= "0000";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';

					--Sets the next state
					state <= ARITH_OUT;

				WHEN SUBI =>
					Imedout <= '1';
					Rtempin <= "10"; --Opens the IN stream in TEMP2 register
					ALU <= '1'; --This should be the signal for SUBTRACTION

					--Zero all the rest
					Rin <= "0000";
					Rout <= "0000";
					Rtempout <= "00";
					Rsysin <= '0';
					Rsysout <= '0';

					--Sets the next state
					state <= ARITH_OUT;

			END CASE ;
		END IF ;
	END PROCESS ;
END Behavior ;