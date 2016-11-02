LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY ex_mem IS
	GENERIC ( address_size, data_size : INTEGER := 32 ) ; 
	PORT ( wb_input: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		   m_input: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		   add_result: IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   zero_flag_input: IN STD_LOGIC;
		   alu_result_input, read_data2_input: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   reg_dest_input: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		   clock: IN STD_LOGIC;
		   wb_output: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		   branch, mem_read, mem_write, zero_flag_output: OUT STD_LOGIC;
		   next_address_output: OUT STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   alu_result_output, read_data2_output: OUT STD_LOGIC_VECTOR(data_size-1 DOWNTO 0);
		   reg_dest_output: OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END ex_mem;

ARCHITECTURE Behavior OF ex_mem IS
BEGIN
	PROCESS
	BEGIN
	WAIT UNTIL clock'EVENT AND clock = '1';
		wb_output <= wb_input;
		branch <= m_input(2);
		mem_read <= m_input(1);
		mem_write <= m_input(0);
		next_address_output <= alu_result_input;
		zero_flag_output <= zero_flag_input;
		alu_result_output <= alu_result_input;
		read_data2_output <= read_data2_input;
		reg_dest_output <= reg_dest_input;
	END PROCESS;
END Behavior;