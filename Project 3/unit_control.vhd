LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY unit_control IS
	PORT ( opcode: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		   wb: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		   m: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		   ex: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END unit_control;

ARCHITECTURE Behavior OF unit_control IS
BEGIN
	PROCESS (opcode)
	BEGIN
		CASE opcode IS
			WHEN "000000" => --R-Type
				wb <= "10"; --reg_write = 1, mem_to_reg = 0;
				m <= "000"; --branch = 0, mem_read = 0, mem_write = 0;
				ex <= "1100"; --reg_dest = 1, alu_op = 10 (r-type), alu_src = 0;
 			WHEN "001000" | "001001" | "001100" | "001101" => --addi | subi | andi | ori
				wb <= "10"; --reg_write = 1, mem_to_reg = 0;
				m <= "000"; --branch = 0, mem_read = 0, mem_write = 0;
				ex <= "0111"; --reg_dest = 0, alu_op = 11 (i-type), alu_src = 1;
			WHEN "100011" => --lw
				wb <= "11"; --reg_write = 1, mem_to_reg = 1;
				m <= "010"; --branch = 0, mem_read = 1, mem_write = 0;
				ex <= "0001"; --reg_dest = 0, alu_op = 00 (lw/sw), alu_src = 1;
			WHEN "101011" => --sw
				wb <= "00"; --reg_write = 0, mem_to_reg = 0;
				m <= "001"; --branch = 0, mem_read = 0, mem_write = 1;
				ex <= "0001"; --reg_dest = 0, alu_op = 00 (lw/sw), alu_src = 1;
			WHEN "000100" => --beq
				wb <= "00"; --reg_write = 0, mem_to_reg = 0;
				m <= "100"; --branch = 1, mem_read = 0, mem_write = 0;
				ex <= "0011"; --reg_dest = 0, alu_op = 01 (branch), alu_src = 1;
			WHEN "000010" => --j
				--to-do: implement jump
		END CASE;
	END PROCESS;
END Behavior;