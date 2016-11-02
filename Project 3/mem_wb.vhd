LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY mem_wb IS
	GENERIC ( address_size, data_size : INTEGER := 32 ) ; 
	PORT ( wb_input: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		   read_data_input, alu_result_input: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   reg_dest_input: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		   clock: IN STD_LOGIC;
		   reg_write, mem_to_reg: OUT STD_LOGIC;
		   read_data_output, alu_result_output: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   reg_dest_output: OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END mem_wb;

ARCHITECTURE Behavior OF mem_wb IS
BEGIN
	PROCESS (clock)
	BEGIN
	WAIT UNTIL clock'EVENT AND clock = '1';
		reg_write <= wb_input(1);
		mem_to_reg <= wb_input(0);
		read_data_output <= read_data_input;
		alu_result_output <= alu_result_input;
		reg_dest_output <= reg_dest_input;
	END PROCESS;
END Behavior;