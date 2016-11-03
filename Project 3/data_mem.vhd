LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY data_mem IS
	GENERIC ( address_size, data_size, data_memory_size : INTEGER := 32 ); 
	PORT ( data_mem_address:  IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   write_data: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   mem_read, mem_write: IN STD_LOGIC;
		   read_data: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0));
END data_mem;

ARCHITECTURE Behavior OF data_mem IS
	TYPE matrix IS ARRAY(data_memory_size-1 DOWNTO 0) of STD_LOGIC_VECTOR(data_size-1 DOWNTO 0);
	SIGNAL memory: matrix;
BEGIN
	PROCESS
	BEGIN
		IF mem_write = '1' THEN
			memory(data_mem_address) <= write_data;
		ELSIF mem_read = '1' THEN
			read_data <= memory(data_mem_address);
		END IF
	END PROCESS;
END Behavior;