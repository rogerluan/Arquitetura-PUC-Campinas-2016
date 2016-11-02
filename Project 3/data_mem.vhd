LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY data_mem IS
	GENERIC ( N : INTEGER := 32 ) ; 
	PORT ( data_mem_address:  IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		   write_data: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		   mem_read, mem_write: STD_LOGIC;
		   read_data: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END data_mem;

ARCHITECTURE Behavior OF data_mem IS
BEGIN
	--to-do: implement this 
END Behavior;