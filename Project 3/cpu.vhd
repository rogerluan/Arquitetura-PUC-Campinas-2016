LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.components.all;

ENTITY cpu IS
	GENERIC ( data_size, address_size, instruction_size: INTEGER := 32 ) ; 
	PORT ( 	clock: IN STD_LOGIC;
			debug_instruction, debug_instruction_fw1: OUT STD_LOGIC_VECTOR (instruction_size-1 DOWNTO 0);
			debug_rs, debug_rt, debug_rd, debug_mem_data: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0)
			debug_instruction_address, debug_pc_plus_four, debug_next_instruction_address, debug_mem_address: OUT STD_LOGIC_VECTOR (address_size-1 DOWNTO 0));
END cpu;

ARCHITECTURE Behavior OF cpu IS
	SIGNAL data_size, instruction_size, address_size: INTEGER := 32;
	SIGNAL useless_output, reg_dest, alu_src, zero_flag, zero_flag_fw1, branch, mem_read, mem_write, reg_write: STD_LOGIC;
	SIGNAL pc_output, pc_plus_four, pc_plus_four_fw1, pc_plus_four_fw2, next_instruction, branch_address, branch_address_fw1: STD_LOGIC_VECTOR(address_size-1 DOWNTO 0);
	SIGNAL instruction, instruction_fw1: STD_LOGIC_VECTOR(instruction_size-1 DOWNTO 0);
	SIGNAL read_data1, read_data2, read_data1_fw1, read_data2_fw1, read_data2_fw2, extended_imed, extended_imed_fw1, extended_imed_sll, main_alu_src2, alu_output, alu_output_fw1, alu_output_fw2, mem_read_data, mem_read_data_fw1: STD_LOGIC_VECTOR(data_size-1 DOWNTO 0);
	SIGNAL wb, wb_fw1, wb_fw2, alu_op: STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL m, m_fw1: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL ex, alu_control: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL rt, rd, final_reg_dest, final_reg_dest_fw1, final_reg_dest_fw2: STD_LOGIC_VECTOR (4 DOWNTO 0);
BEGIN 

	-- ALU Components
	pc_plus_four_adder: alu_component PORT MAP (pc_output, "00000000000000000000000000000100", "0010", useless_output, pc_plus_four);
	branch_alu: alu_component PORT MAP (pc_plus_four_fw2, extended_imed_sll, "0010", useless_output, branch_address);
	main_alu: alu_component PORT MAP (read_data1_fw1, main_alu_src2, alu_control, zero_flag, alu_output);


	-- Pipeline Components
	if_to_id: if_id
	PORT MAP (
		next_address_input <= pc_plus_four,
		instruction_input <= instruction,
		clock <= clock,
		next_address_output <= pc_plus_four_fw1,
		instruction_output <= instruction_fw1
	);
	id_to_ex: id_ex
	PORT MAP (	
	   wb_input => wb,
	   m_input => m,
	   ex_input => ex,
	   next_address_input => pc_plus_four_fw1,
	   read_data1_input => read_data1,
	   read_data2_input => read_data2,
	   imed_input => extended_imed,
	   rt_input => instruction_fw1(instruction_size-12 DOWNTO instruction_size-16),
	   rd_input => instruction_fw1(instruction_size-17 DOWNTO instruction_size-21),
	   clock => clock,
	   wb_output => wb_fw1,
	   alu_op => alu_op,
	   m_output => m_fw1,
	   reg_dest => reg_dest,
	   alu_src => alu_src,
	   next_address_output => pc_plus_four_fw2,
	   read_data1_output => read_data1_fw1,
	   read_data2_output => read_data2_fw1,
	   imed_output => extended_imed_fw1,
	   rt_output => rt,
	   rd_output => rd
	);
	ex_to_mem: ex_mem 
	PORT MAP (
		wb_input => wb_fw1,
		m_input => m_fw1,
		add_result => branch_address,
		zero_flag_input => zero_flag,
		alu_result_input => alu_output, 
		read_data2_input => read_data2_fw1,
		reg_dest_input => final_reg_dest,
		clock => clock,
		wb_output => wb_fw2,
		branch => branch, 
		mem_read => mem_read, 
		mem_write => mem_write, 
		zero_flag_output => zero_flag_fw1,
		next_address_output => branch_address_fw1,
		alu_result_output => alu_output_fw1,
		read_data2_output => read_data2_fw2,
		reg_dest_output => final_reg_dest_fw1
	);
	mem_to_wb: mem_wb
	PORT MAP (
		wb_input => wb_fw2,
		read_data_input => mem_read_data,
		alu_result_input => alu_output_fw1,
		reg_dest_input => final_reg_dest_fw1,
		clock => clock,
		reg_write => reg_write,
		mem_to_reg => mem_to_reg,
		read_data_output => mem_read_data_fw1,
		alu_result_output => alu_output_fw2,
		reg_dest_output => final_reg_dest_fw2
	};


	-- Memory Components
	i_mem: instruction_mem PORT MAP (pc_output, instruction);
	d_mem: data_mem PORT MAP (alu_output_fw1, read_data2_fw2, mem_read, mem_write, mem_read_data);


	-- Registers
	registers: registers_file PORT MAP (instruction_fw1(instruction_size-7 DOWNTO instruction_size-11),
										instruction_fw1(instruction_size-12 DOWNTO instruction_size-16),
										final_reg_dest_fw2,
										write_data,
										clock,
										reg_write, 
										read_data1,
										read_data2);
	pc: program_counter PORT MAP (next_instruction, pc_output);


	-- Multiplexors
	mux_pc: mux2to1 PORT MAP (pc_plus_four, branch_address_fw1, branch AND zero_flag_fw1, next_instruction);
	mux_main_alu: mux2to1 PORT MAP (read_data2_fw1, extended_imed_fw1, alu_src, main_alu_src2);
	mux_reg_dest: mux2to1 PORT MAP (rt, rd, reg_dest, final_reg_dest);
	mux_mem_to_reg: mux2to1 PORT MAP (mem_read_data_fw1, alu_output_fw2, mem_to_reg, write_data);


	-- Controllers
	main_uc: unit_control PORT MAP (instruction_fw1(instruction_size-1 DOWNTO instruction_size-6), wb, m, ex);
	alu_ctrl: alu_control PORT MAP (extended_imed_fw1(5 DOWNTO 0), alu_op, alu_control);


	-- Minor Components
	sign_extend: sign_ext PORT MAP (instruction_fw1(instruction_size-17 DOWNTO 0), extended_imed);
	shift_left: shift_left_2 PORT MAP (extended_imed_fw1, );


	-- Debugging Variables
	debug_instruction <= instruction;
	debug_instruction_fw1 <= instruction_fw1;
	debug_rs <= read_data1;
	debug_rt <= read_data2;
	debug_rd <= write_data;
	debug_instruction_address <= pc_output;
	debug_pc_plus_four <= pc_plus_four;
	debug_next_instruction_address <= next_instruction;
	debug_mem_data <= mem_read_data;
	debug_mem_address <= alu_output_fw1;

END Behavior;