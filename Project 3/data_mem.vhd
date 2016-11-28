LIBRARY ieee;
USE ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

ENTITY data_mem IS
	GENERIC ( address_size, data_size : INTEGER := 32 ); 
	PORT ( data_mem_address:  IN STD_LOGIC_VECTOR (address_size-1 DOWNTO 0);
		   write_data: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
		   mem_read, mem_write: IN STD_LOGIC;
		   read_data: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0));
END data_mem;

ARCHITECTURE Behavior OF data_mem IS
	TYPE matrix IS ARRAY(0 TO 4294967295) of STD_LOGIC_VECTOR(data_size-1 DOWNTO 0);
	SIGNAL memory: matrix;
BEGIN
	PROCESS (mem_write, mem_read)
	BEGIN
		IF mem_write = '1' THEN
			memory(to_integer(unsigned(data_mem_address))) <= write_data;
		ELSIF mem_read = '1' THEN
			read_data <= memory(to_integer(unsigned(data_mem_address)));
		END IF;
	END PROCESS;
END Behavior;