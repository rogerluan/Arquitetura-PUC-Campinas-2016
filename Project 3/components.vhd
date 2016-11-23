LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
-- Math Libraries
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 

PACKAGE components IS

	COMPONENT alu_component
		GENERIC ( data_size : INTEGER := 32 ) ; 
		PORT ( alu_operand1, alu_operand2:  IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
			   alu_control: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			   alu_zero_flag: OUT STD_LOGIC;
			   alu_output: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT alu_control
		GENERIC ( N : INTEGER := 32 ) ; 
		PORT ( funct:  IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			   alu_op: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			   alu_control: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;

	COMPONENT instruction_mem
		GENERIC ( address_size, instruction_size : INTEGER := 32 ) ; 
		PORT ( instruction_mem_address:  IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
			   instruction: OUT STD_LOGIC_VECTOR (instruction_size-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT data_mem
		GENERIC ( N : INTEGER := 32 ) ; 
		PORT ( data_mem_address:  IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			   write_data: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			   mem_read, mem_write: STD_LOGIC;
			   read_data: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT mux2to1
		GENERIC ( N : INTEGER := 32 ) ; 
		PORT ( mux_source0, mux_source1:  IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			   mux_control: IN STD_LOGIC;
			   mux_output: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT sign_ext
		PORT ( SignExtInput:  IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			   SignExtOutput: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	END COMPONENT;

	COMPONENT shift_left_2
		PORT ( input_data: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			   output_data: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT unit_control
		PORT ( opcode: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			   wb: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			   m: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			   ex: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;

	COMPONENT registers_file
		GENERIC ( data_size, number_of_registers : INTEGER := 32 ) ; 
		PORT ( read_reg1, read_reg2, write_reg: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			   write_data: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
			   clock, reg_write: IN STD_LOGIC);
			   read_data1, read_data2: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT program_counter
		GENERIC ( address_size: INTEGER := 32 );
		PORT ( instruction: IN STD_LOGIC_VECTOR(address_size-1 DOWNTO 0);
			   clock: IN STD_LOGIC;
			   instruction_address: OUT STD_LOGIC_VECTOR(address_size-1 DOWNTO 0));
	END COMPONENT;

	-- Pipeline Components 

	COMPONENT if_id
		GENERIC ( address_size, instruction_size : INTEGER := 32 ) ; 
		PORT ( next_address_input: IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
			   instruction_input: IN STD_LOGIC_VECTOR (instruction_size-1 DOWNTO 0);
			   clock: IN STD_LOGIC;
			   next_address_output: OUT STD_LOGIC_VECTOR (address_size-1 DOWNTO 0)
			   instruction_output: OUT STD_LOGIC_VECTOR (instruction_size-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT id_ex
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
	END COMPONENT;

	COMPONENT ex_mem
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
	END COMPONENT;
	
	COMPONENT mem_wb
		GENERIC ( address_size, data_size : INTEGER := 32 ) ; 
		PORT ( wb_input: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			   read_data_input, alu_result_input: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
			   reg_dest_input: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			   clock: IN STD_LOGIC;
			   reg_write, mem_to_reg: OUT STD_LOGIC;
			   read_data_output, alu_result_output: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
			   reg_dest_output: OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
	END COMPONENT;

END components;