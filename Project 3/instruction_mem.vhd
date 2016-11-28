LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY instruction_mem IS
	GENERIC ( address_size, instruction_size: INTEGER := 32 ) ; 
	PORT ( instruction_mem_address:  IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   instruction: OUT STD_LOGIC_VECTOR (instruction_size-1 DOWNTO 0));
END instruction_mem;

ARCHITECTURE Behavior OF instruction_mem IS
	SIGNAL mem_position: INTEGER;
	type MEM_ARRAY is array (7 downto 0) of STD_LOGIC;
	type MEM is array (0 to 4294967295) of MEM_ARRAY;
	--TYPE matrix IS ARRAY(0 TO 4294967295) of STD_LOGIC_VECTOR(7 DOWNTO 0); --8 bits = 1 byte
	SIGNAL instructions: MEM;
BEGIN

	-- This will be all hard coded, just for practical and study purposes.

	-- HERE WE SHOULD HAVE AT LEAST 1 EXAMPLE OF EACH INSTRUCTION IN THE INSTRUCTION SET
--	instructions(0) <= "01010101";
--	instructions(1) <= "01010101";
--	instructions(2) <= "01010101";
--	instructions(3) <= "01010101";
--	instructions(4) <= "01010101";
--	instructions(5) <= "01010101";
--	instructions(6) <= "01010101";
--	instructions(7) <= "01010101";
--	instructions(8) <= "01010101";
--	instructions(9) <= "01010101";
--	instructions(10) <= "01010101";
--	instructions(11) <= "01010101";
--	instructions(12) <= "01010101";
--	instructions(13) <= "01010101";
--	instructions(14) <= "01010101";
--	instructions(15) <= "01010101";
--	instructions(16) <= "01010101";
--	instructions(17) <= "01010101";
--	instructions(18) <= "01010101";
--	instructions(19) <= "01010101";
--	instructions(20) <= "01010101";
--	instructions(21) <= "01010101";
--	instructions(22) <= "01010101";
--	instructions(23) <= "01010101";
--	instructions(24) <= "01010101";
--	instructions(25) <= "01010101";
--	instructions(26) <= "01010101";
--	instructions(27) <= "01010101";
--	instructions(28) <= "01010101";
--	instructions(29) <= "01010101";
--	instructions(30) <= "01010101";
--	instructions(31) <= "01010101";
--	instructions(32) <= "01010101";
--	instructions(33) <= "01010101";
--	instructions(34) <= "01010101";
--	instructions(35) <= "01010101";
--	instructions(36) <= "01010101";
--	instructions(37) <= "01010101";
--	instructions(38) <= "01010101";
--	instructions(39) <= "01010101";
--	instructions(40) <= "01010101";
--	instructions(41) <= "01010101";
--	instructions(42) <= "01010101";
--	instructions(43) <= "01010101";
--	instructions(44) <= "01010101";
--	instructions(45) <= "01010101";
--	instructions(46) <= "01010101";
--	instructions(47) <= "01010101";
--	instructions(48) <= "01010101";
--	instructions(49) <= "01010101";
--	instructions(50) <= "01010101";
--	instructions(51) <= "01010101";
	-- ...this should go on, but we only need to test the 13 instructions

	mem_position <= to_integer(unsigned(instruction_mem_address));
	--instruction <= unsigned(instructions(mem_position)) & unsigned(instructions(mem_position)) & unsigned(instructions(mem_position)) & unsigned(instructions(mem_position)); --concatenate 4 sequences of bytes in order to build the full 32 bits instruction
	instruction <= "00001111" & "11110000" & "11110000" & "00001111";
END Behavior;