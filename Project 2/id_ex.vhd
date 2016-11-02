LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY id_ex IS
	GENERIC ( address_size, data_size, imed_ext_size : INTEGER := 32 ) ; 
	PORT ( wb_input: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		   m_input: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		   ex_input: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		   next_address_input: IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   read_data1_input, read_data2_input: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   imed_input: IN STD_LOGIC_VECTOR (imed_ext_size-1 DOWNTO 0);
		   rt_input, rd_input: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		   clock: IN STD_LOGIC;
		   wb_output, alu_op: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		   m_output: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		   reg_dest, alu_src: OUT STD_LOGIC;
		   next_address_output: OUT STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   read_data1_output, read_data2_output: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   imed_output: OUT STD_LOGIC_VECTOR (imed_ext_size-1 DOWNTO 0);
		   rt_output, rd_output: OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END id_ex;

ARCHITECTURE Behavior OF id_ex IS
BEGIN
	PROCESS
	BEGIN
	WAIT UNTIL clock'EVENT AND clock = '1';
		wb_output <= wb_input;
		m_output <= m_input;
		reg_dest <= ex_input(3);
		alu_op <= ex_input(2 DOWNTO 1);
		alu_src <= ex_input(0);
		next_address_output <= next_address_input;
		read_data1_output <= read_data1_input;
		read_data2_output <= read_data2_input;
		imed_output <= imed_input;
		rd_output <= rd_input;
		rt_output <= rt_input;
	END PROCESS;
END Behavior;