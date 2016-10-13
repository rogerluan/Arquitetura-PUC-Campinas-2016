-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"

-- DATE "10/13/2016 20:11:09"

-- 
-- Device: Altera EPM1270F256C3 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	cpu IS
    PORT (
	Data : IN std_logic_vector(24 DOWNTO 0);
	Clock : IN std_logic;
	BusWires : INOUT std_logic_vector(15 DOWNTO 0);
	r0_stream : OUT std_logic_vector(15 DOWNTO 0);
	r1_stream : OUT std_logic_vector(15 DOWNTO 0);
	r2_stream : OUT std_logic_vector(15 DOWNTO 0);
	r3_stream : OUT std_logic_vector(15 DOWNTO 0);
	rsys_stream : OUT std_logic_vector(15 DOWNTO 0);
	rtemp0_stream : OUT std_logic_vector(15 DOWNTO 0);
	rtemp1_stream : OUT std_logic_vector(15 DOWNTO 0)
	);
END cpu;

-- Design Ports Information


ARCHITECTURE structure OF cpu IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Data : std_logic_vector(24 DOWNTO 0);
SIGNAL ww_Clock : std_logic;
SIGNAL ww_r0_stream : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_r1_stream : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_r2_stream : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_r3_stream : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rsys_stream : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rtemp0_stream : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rtemp1_stream : std_logic_vector(15 DOWNTO 0);
SIGNAL \BusWires[0]~0\ : std_logic;
SIGNAL \BusWires[1]~1\ : std_logic;
SIGNAL \BusWires[2]~2\ : std_logic;
SIGNAL \BusWires[3]~3\ : std_logic;
SIGNAL \BusWires[4]~4\ : std_logic;
SIGNAL \BusWires[5]~5\ : std_logic;
SIGNAL \BusWires[6]~6\ : std_logic;
SIGNAL \BusWires[7]~7\ : std_logic;
SIGNAL \BusWires[8]~8\ : std_logic;
SIGNAL \BusWires[9]~9\ : std_logic;
SIGNAL \BusWires[10]~10\ : std_logic;
SIGNAL \BusWires[11]~11\ : std_logic;
SIGNAL \BusWires[12]~12\ : std_logic;
SIGNAL \BusWires[13]~13\ : std_logic;
SIGNAL \BusWires[14]~14\ : std_logic;
SIGNAL \BusWires[15]~15\ : std_logic;
SIGNAL \Clock~combout\ : std_logic;
SIGNAL \unit_control|state.ARITH_IN~regout\ : std_logic;
SIGNAL \unit_control|state.MOV~regout\ : std_logic;
SIGNAL \unit_control|state.ADD~regout\ : std_logic;
SIGNAL \unit_control|state.ADDI~regout\ : std_logic;
SIGNAL \unit_control|state.SUBI~regout\ : std_logic;
SIGNAL \unit_control|WideOr5~3_combout\ : std_logic;
SIGNAL \unit_control|state.SUB~regout\ : std_logic;
SIGNAL \unit_control|state.ARITH_OUT~regout\ : std_logic;
SIGNAL \unit_control|Rsysin~regout\ : std_logic;
SIGNAL \unit_control|state.MOVI~regout\ : std_logic;
SIGNAL \unit_control|WideOr5~2\ : std_logic;
SIGNAL \unit_control|Selector0~0\ : std_logic;
SIGNAL \unit_control|state.DECODE~regout\ : std_logic;
SIGNAL \unit_control|state.XCHG_1~regout\ : std_logic;
SIGNAL \unit_control|WideOr8~0_combout\ : std_logic;
SIGNAL \unit_control|WideOr6~0_combout\ : std_logic;
SIGNAL \unit_control|Selector7~0\ : std_logic;
SIGNAL \unit_control|Selector8~1_combout\ : std_logic;
SIGNAL \unit_control|state.XCHG_3~regout\ : std_logic;
SIGNAL \unit_control|WideOr5~combout\ : std_logic;
SIGNAL \unit_control|Selector6~0_combout\ : std_logic;
SIGNAL \unit_control|WideOr4~0\ : std_logic;
SIGNAL \tri_rtemp0|F[0]~17\ : std_logic;
SIGNAL \tri_rtemp0|F[0]~18\ : std_logic;
SIGNAL \unit_control|Imedout~regout\ : std_logic;
SIGNAL \unit_control|Selector5~0_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[0]~19\ : std_logic;
SIGNAL \unit_control|Selector8~0\ : std_logic;
SIGNAL \tri_rtemp0|F[0]~21_combout\ : std_logic;
SIGNAL \unit_control|Rsysout~regout\ : std_logic;
SIGNAL \tri_rtemp0|F[0]~16\ : std_logic;
SIGNAL \tri_rtemp0|F[0]~20_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[0]~22\ : std_logic;
SIGNAL \tri_rtemp0|F[1]~25\ : std_logic;
SIGNAL \tri_rtemp0|F[1]~26\ : std_logic;
SIGNAL \tri_rtemp0|F[1]~24\ : std_logic;
SIGNAL \tri_rtemp0|F[1]~23\ : std_logic;
SIGNAL \tri_rtemp0|F[1]~27_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[2]~30\ : std_logic;
SIGNAL \tri_rtemp0|F[2]~31\ : std_logic;
SIGNAL \tri_rtemp0|F[2]~29\ : std_logic;
SIGNAL \tri_rtemp0|F[2]~28\ : std_logic;
SIGNAL \tri_rtemp0|F[2]~32_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[3]~36\ : std_logic;
SIGNAL \tri_rtemp0|F[3]~34\ : std_logic;
SIGNAL \tri_rtemp0|F[3]~33\ : std_logic;
SIGNAL \tri_rtemp0|F[3]~35\ : std_logic;
SIGNAL \tri_rtemp0|F[3]~37_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[4]~38\ : std_logic;
SIGNAL \tri_rtemp0|F[4]~40\ : std_logic;
SIGNAL \tri_rtemp0|F[4]~39\ : std_logic;
SIGNAL \tri_rtemp0|F[4]~41\ : std_logic;
SIGNAL \tri_rtemp0|F[4]~42_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[5]~44\ : std_logic;
SIGNAL \tri_rtemp0|F[5]~45\ : std_logic;
SIGNAL \tri_rtemp0|F[5]~43\ : std_logic;
SIGNAL \tri_rtemp0|F[5]~46\ : std_logic;
SIGNAL \tri_rtemp0|F[5]~47_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[6]~50\ : std_logic;
SIGNAL \tri_rtemp0|F[6]~49\ : std_logic;
SIGNAL \tri_rtemp0|F[6]~51\ : std_logic;
SIGNAL \tri_rtemp0|F[6]~48\ : std_logic;
SIGNAL \tri_rtemp0|F[6]~52_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[7]~56\ : std_logic;
SIGNAL \tri_rtemp0|F[7]~54\ : std_logic;
SIGNAL \tri_rtemp0|F[7]~53\ : std_logic;
SIGNAL \tri_rtemp0|F[7]~55\ : std_logic;
SIGNAL \tri_rtemp0|F[7]~57_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[8]~58\ : std_logic;
SIGNAL \tri_rtemp0|F[8]~59\ : std_logic;
SIGNAL \tri_rtemp0|F[8]~60\ : std_logic;
SIGNAL \tri_rtemp0|F[8]~61\ : std_logic;
SIGNAL \tri_rtemp0|F[8]~62_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[9]~66\ : std_logic;
SIGNAL \tri_rtemp0|F[9]~64\ : std_logic;
SIGNAL \tri_rtemp0|F[9]~63\ : std_logic;
SIGNAL \tri_rtemp0|F[9]~65\ : std_logic;
SIGNAL \tri_rtemp0|F[9]~67_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[10]~71\ : std_logic;
SIGNAL \tri_rtemp0|F[10]~70\ : std_logic;
SIGNAL \tri_rtemp0|F[10]~69\ : std_logic;
SIGNAL \tri_rtemp0|F[10]~68\ : std_logic;
SIGNAL \tri_rtemp0|F[10]~72_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[11]~76\ : std_logic;
SIGNAL \tri_rtemp0|F[11]~74\ : std_logic;
SIGNAL \tri_rtemp0|F[11]~73\ : std_logic;
SIGNAL \tri_rtemp0|F[11]~75\ : std_logic;
SIGNAL \tri_rtemp0|F[11]~77_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[12]~81\ : std_logic;
SIGNAL \tri_rtemp0|F[12]~79\ : std_logic;
SIGNAL \tri_rtemp0|F[12]~78\ : std_logic;
SIGNAL \tri_rtemp0|F[12]~80\ : std_logic;
SIGNAL \tri_rtemp0|F[12]~82_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[13]~83\ : std_logic;
SIGNAL \tri_rtemp0|F[13]~85\ : std_logic;
SIGNAL \tri_rtemp0|F[13]~86\ : std_logic;
SIGNAL \tri_rtemp0|F[13]~84\ : std_logic;
SIGNAL \tri_rtemp0|F[13]~87_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[14]~90\ : std_logic;
SIGNAL \tri_rtemp0|F[14]~91\ : std_logic;
SIGNAL \tri_rtemp0|F[14]~88\ : std_logic;
SIGNAL \tri_rtemp0|F[14]~89\ : std_logic;
SIGNAL \tri_rtemp0|F[14]~92_combout\ : std_logic;
SIGNAL \tri_rtemp0|F[15]~93\ : std_logic;
SIGNAL \tri_rtemp0|F[15]~94\ : std_logic;
SIGNAL \tri_rtemp0|F[15]~96\ : std_logic;
SIGNAL \tri_rtemp0|F[15]~95\ : std_logic;
SIGNAL \tri_rtemp0|F[15]~97_combout\ : std_logic;
SIGNAL \unit_control|Rtempout\ : std_logic_vector(0 TO 1);
SIGNAL \reg2|Q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \regsys|Q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \unit_control|Rout\ : std_logic_vector(0 TO 3);
SIGNAL \unit_control|regTarget\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Data~combout\ : std_logic_vector(24 DOWNTO 0);
SIGNAL \regtemp0|Q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \reg1|Q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \reg3|Q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \reg0|Q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \unit_control|Rin\ : std_logic_vector(0 TO 3);
SIGNAL \unit_control|regSource\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \unit_control|Rtempin\ : std_logic_vector(0 TO 1);
SIGNAL \unit_control|regDest\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \unit_control|instruction\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \unit_control|ALT_INV_state.DECODE~regout\ : std_logic;

BEGIN

ww_Data <= Data;
ww_Clock <= Clock;
r0_stream <= ww_r0_stream;
r1_stream <= ww_r1_stream;
r2_stream <= ww_r2_stream;
r3_stream <= ww_r3_stream;
rsys_stream <= ww_rsys_stream;
rtemp0_stream <= ww_rtemp0_stream;
rtemp1_stream <= ww_rtemp1_stream;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\unit_control|ALT_INV_state.DECODE~regout\ <= NOT \unit_control|state.DECODE~regout\;

-- Location: PIN_M16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[0]~20_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(0),
	combout => \BusWires[0]~0\);

-- Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[1]~27_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(1),
	combout => \BusWires[1]~1\);

-- Location: PIN_K11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[2]~32_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(2),
	combout => \BusWires[2]~2\);

-- Location: PIN_L12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[3]~37_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(3),
	combout => \BusWires[3]~3\);

-- Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[4]~42_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(4),
	combout => \BusWires[4]~4\);

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[5]~47_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(5),
	combout => \BusWires[5]~5\);

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[6]~52_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(6),
	combout => \BusWires[6]~6\);

-- Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[7]~57_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(7),
	combout => \BusWires[7]~7\);

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[8]~62_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(8),
	combout => \BusWires[8]~8\);

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[9]~67_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(9),
	combout => \BusWires[9]~9\);

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[10]~72_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(10),
	combout => \BusWires[10]~10\);

-- Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[11]~77_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(11),
	combout => \BusWires[11]~11\);

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[12]~82_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(12),
	combout => \BusWires[12]~12\);

-- Location: PIN_K13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[13]~87_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(13),
	combout => \BusWires[13]~13\);

-- Location: PIN_K14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[14]~92_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(14),
	combout => \BusWires[14]~14\);

-- Location: PIN_K12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\BusWires[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \tri_rtemp0|F[15]~97_combout\,
	oe => \tri_rtemp0|F[0]~22\,
	padio => BusWires(15),
	combout => \BusWires[15]~15\);

-- Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clock~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Clock,
	combout => \Clock~combout\);

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[20]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(20),
	combout => \Data~combout\(20));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[18]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(18),
	combout => \Data~combout\(18));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[23]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(23),
	combout => \Data~combout\(23));

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[24]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(24),
	combout => \Data~combout\(24));

-- Location: LC_X15_Y8_N7
\unit_control|instruction[2]\ : maxii_lcell
-- Equation(s):
-- \unit_control|instruction\(2) = DFFEAS((((\Data~combout\(24)))), GLOBAL(\Clock~combout\), VCC, , !\unit_control|state.DECODE~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datad => \Data~combout\(24),
	aclr => GND,
	ena => \unit_control|ALT_INV_state.DECODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|instruction\(2));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[22]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(22),
	combout => \Data~combout\(22));

-- Location: LC_X16_Y7_N8
\unit_control|state.ARITH_IN\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.ARITH_IN~regout\ = DFFEAS(((\unit_control|instruction\(2) & ((!\unit_control|state.DECODE~regout\)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00cc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \unit_control|instruction\(2),
	datad => \unit_control|state.DECODE~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.ARITH_IN~regout\);

-- Location: LC_X15_Y8_N5
\unit_control|instruction[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Selector0~0\ = (!\unit_control|state.ARITH_IN~regout\ & ((\unit_control|state.DECODE~regout\) # ((\unit_control|instruction\(1)) # (E1_instruction[0]))))
-- \unit_control|instruction\(0) = DFFEAS(\unit_control|Selector0~0\, GLOBAL(\Clock~combout\), VCC, , !\unit_control|state.DECODE~regout\, \Data~combout\(22), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00fe",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.DECODE~regout\,
	datab => \unit_control|instruction\(1),
	datac => \Data~combout\(22),
	datad => \unit_control|state.ARITH_IN~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|ALT_INV_state.DECODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|Selector0~0\,
	regout => \unit_control|instruction\(0));

-- Location: LC_X15_Y7_N6
\unit_control|state.MOV\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.MOV~regout\ = DFFEAS((!\unit_control|state.DECODE~regout\ & (!\unit_control|instruction\(2) & (\unit_control|instruction\(1) & !\unit_control|instruction\(0)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.DECODE~regout\,
	datab => \unit_control|instruction\(2),
	datac => \unit_control|instruction\(1),
	datad => \unit_control|instruction\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.MOV~regout\);

-- Location: LC_X13_Y7_N2
\unit_control|state.ADD\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.ADD~regout\ = DFFEAS((\unit_control|state.ARITH_IN~regout\ & (!\unit_control|instruction\(1) & (\unit_control|instruction\(2) & !\unit_control|instruction\(0)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0020",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.ARITH_IN~regout\,
	datab => \unit_control|instruction\(1),
	datac => \unit_control|instruction\(2),
	datad => \unit_control|instruction\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.ADD~regout\);

-- Location: LC_X14_Y7_N9
\unit_control|state.ADDI\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.ADDI~regout\ = DFFEAS((\unit_control|instruction\(2) & (\unit_control|instruction\(0) & (!\unit_control|instruction\(1) & \unit_control|state.ARITH_IN~regout\))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|instruction\(2),
	datab => \unit_control|instruction\(0),
	datac => \unit_control|instruction\(1),
	datad => \unit_control|state.ARITH_IN~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.ADDI~regout\);

-- Location: LC_X14_Y7_N1
\unit_control|state.SUBI\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.SUBI~regout\ = DFFEAS((\unit_control|instruction\(2) & (\unit_control|instruction\(0) & (\unit_control|instruction\(1) & \unit_control|state.ARITH_IN~regout\))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|instruction\(2),
	datab => \unit_control|instruction\(0),
	datac => \unit_control|instruction\(1),
	datad => \unit_control|state.ARITH_IN~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.SUBI~regout\);

-- Location: LC_X14_Y7_N7
\unit_control|WideOr5~3\ : maxii_lcell
-- Equation(s):
-- \unit_control|WideOr5~3_combout\ = ((!\unit_control|state.ADDI~regout\ & (!\unit_control|state.ARITH_OUT~regout\ & !\unit_control|state.SUBI~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0003",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \unit_control|state.ADDI~regout\,
	datac => \unit_control|state.ARITH_OUT~regout\,
	datad => \unit_control|state.SUBI~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|WideOr5~3_combout\);

-- Location: LC_X13_Y7_N7
\unit_control|state.SUB\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.SUB~regout\ = DFFEAS((\unit_control|state.ARITH_IN~regout\ & (\unit_control|instruction\(1) & (\unit_control|instruction\(2) & !\unit_control|instruction\(0)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.ARITH_IN~regout\,
	datab => \unit_control|instruction\(1),
	datac => \unit_control|instruction\(2),
	datad => \unit_control|instruction\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.SUB~regout\);

-- Location: LC_X14_Y7_N4
\unit_control|state.ARITH_OUT\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.ARITH_OUT~regout\ = DFFEAS(((\unit_control|state.ADD~regout\) # ((\unit_control|state.SUB~regout\) # (!\unit_control|WideOr5~3_combout\))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffcf",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \unit_control|state.ADD~regout\,
	datac => \unit_control|WideOr5~3_combout\,
	datad => \unit_control|state.SUB~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.ARITH_OUT~regout\);

-- Location: LC_X15_Y7_N4
\unit_control|Rsysin\ : maxii_lcell
-- Equation(s):
-- \unit_control|WideOr4~0\ = (\unit_control|state.MOV~regout\) # ((\unit_control|state.ARITH_OUT~regout\) # ((E1_Rsysin) # (!\unit_control|WideOr5~2\)))
-- \unit_control|Rsysin~regout\ = DFFEAS(\unit_control|WideOr4~0\, GLOBAL(\Clock~combout\), VCC, , , \unit_control|state.XCHG_1~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "feff",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.MOV~regout\,
	datab => \unit_control|state.ARITH_OUT~regout\,
	datac => \unit_control|state.XCHG_1~regout\,
	datad => \unit_control|WideOr5~2\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|WideOr4~0\,
	regout => \unit_control|Rsysin~regout\);

-- Location: LC_X15_Y7_N9
\unit_control|state.MOVI\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.MOVI~regout\ = DFFEAS((!\unit_control|state.DECODE~regout\ & (!\unit_control|instruction\(2) & (!\unit_control|instruction\(1) & \unit_control|instruction\(0)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.DECODE~regout\,
	datab => \unit_control|instruction\(2),
	datac => \unit_control|instruction\(1),
	datad => \unit_control|instruction\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.MOVI~regout\);

-- Location: LC_X15_Y7_N3
\unit_control|state.XCHG_3\ : maxii_lcell
-- Equation(s):
-- \unit_control|WideOr5~2\ = (((!E1_state.XCHG_3 & !\unit_control|state.MOVI~regout\)))
-- \unit_control|state.XCHG_3~regout\ = DFFEAS(\unit_control|WideOr5~2\, GLOBAL(\Clock~combout\), VCC, , , \unit_control|Rsysin~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \unit_control|Rsysin~regout\,
	datad => \unit_control|state.MOVI~regout\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|WideOr5~2\,
	regout => \unit_control|state.XCHG_3~regout\);

-- Location: LC_X15_Y8_N6
\unit_control|state.DECODE\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.DECODE~regout\ = DFFEAS((!\unit_control|state.MOV~regout\ & (\unit_control|WideOr5~2\ & ((\unit_control|instruction\(2)) # (\unit_control|Selector0~0\)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5040",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.MOV~regout\,
	datab => \unit_control|instruction\(2),
	datac => \unit_control|WideOr5~2\,
	datad => \unit_control|Selector0~0\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.DECODE~regout\);

-- Location: LC_X15_Y8_N9
\unit_control|instruction[1]\ : maxii_lcell
-- Equation(s):
-- \unit_control|instruction\(1) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , !\unit_control|state.DECODE~regout\, \Data~combout\(23), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \Data~combout\(23),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|ALT_INV_state.DECODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|instruction\(1));

-- Location: LC_X16_Y7_N5
\unit_control|state.XCHG_1\ : maxii_lcell
-- Equation(s):
-- \unit_control|state.XCHG_1~regout\ = DFFEAS((\unit_control|instruction\(1) & (!\unit_control|instruction\(2) & (\unit_control|instruction\(0) & !\unit_control|state.DECODE~regout\))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0020",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|instruction\(1),
	datab => \unit_control|instruction\(2),
	datac => \unit_control|instruction\(0),
	datad => \unit_control|state.DECODE~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|state.XCHG_1~regout\);

-- Location: LC_X16_Y7_N1
\unit_control|WideOr8~0\ : maxii_lcell
-- Equation(s):
-- \unit_control|WideOr8~0_combout\ = (\unit_control|state.XCHG_1~regout\) # ((\unit_control|state.ARITH_IN~regout\) # ((\unit_control|state.MOV~regout\) # (\unit_control|Rsysin~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \unit_control|state.XCHG_1~regout\,
	datab => \unit_control|state.ARITH_IN~regout\,
	datac => \unit_control|state.MOV~regout\,
	datad => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|WideOr8~0_combout\);

-- Location: LC_X16_Y7_N9
\unit_control|regSource[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|regSource\(0) = DFFEAS((\unit_control|state.XCHG_1~regout\ & (\Data~combout\(20))) # (!\unit_control|state.XCHG_1~regout\ & (((\Data~combout\(18))))), GLOBAL(\Clock~combout\), VCC, , \unit_control|WideOr8~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "acac",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(20),
	datab => \Data~combout\(18),
	datac => \unit_control|state.XCHG_1~regout\,
	aclr => GND,
	ena => \unit_control|WideOr8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|regSource\(0));

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[17]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(17),
	combout => \Data~combout\(17));

-- Location: LC_X13_Y7_N8
\unit_control|WideOr6~0\ : maxii_lcell
-- Equation(s):
-- \unit_control|WideOr6~0_combout\ = (((\unit_control|state.SUB~regout\) # (\unit_control|state.ADD~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \unit_control|state.SUB~regout\,
	datad => \unit_control|state.ADD~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|WideOr6~0_combout\);

-- Location: LC_X13_Y7_N6
\unit_control|regTarget[1]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Selector7~0\ = (!\unit_control|regTarget\(0) & (E1_regTarget[1] & ((\unit_control|state.SUB~regout\) # (\unit_control|state.ADD~regout\))))
-- \unit_control|regTarget\(1) = DFFEAS(\unit_control|Selector7~0\, GLOBAL(\Clock~combout\), VCC, , \unit_control|WideOr6~0_combout\, \Data~combout\(17), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5040",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|regTarget\(0),
	datab => \unit_control|state.SUB~regout\,
	datac => \Data~combout\(17),
	datad => \unit_control|state.ADD~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|Selector7~0\,
	regout => \unit_control|regTarget\(1));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[16]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(16),
	combout => \Data~combout\(16));

-- Location: LC_X13_Y7_N3
\unit_control|regTarget[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Selector8~0\ = (\unit_control|regTarget\(1) & (E1_regTarget[0] & ((\unit_control|state.SUB~regout\) # (\unit_control|state.ADD~regout\))))
-- \unit_control|regTarget\(0) = DFFEAS(\unit_control|Selector8~0\, GLOBAL(\Clock~combout\), VCC, , \unit_control|WideOr6~0_combout\, \Data~combout\(16), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a080",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|regTarget\(1),
	datab => \unit_control|state.SUB~regout\,
	datac => \Data~combout\(16),
	datad => \unit_control|state.ADD~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|Selector8~0\,
	regout => \unit_control|regTarget\(0));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[19]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(19),
	combout => \Data~combout\(19));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[21]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(21),
	combout => \Data~combout\(21));

-- Location: LC_X16_Y7_N3
\unit_control|regSource[1]\ : maxii_lcell
-- Equation(s):
-- \unit_control|regSource\(1) = DFFEAS(((\unit_control|state.XCHG_1~regout\ & ((\Data~combout\(21)))) # (!\unit_control|state.XCHG_1~regout\ & (\Data~combout\(19)))), GLOBAL(\Clock~combout\), VCC, , \unit_control|WideOr8~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fa0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(19),
	datac => \unit_control|state.XCHG_1~regout\,
	datad => \Data~combout\(21),
	aclr => GND,
	ena => \unit_control|WideOr8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|regSource\(1));

-- Location: LC_X14_Y7_N6
\unit_control|Selector8~1\ : maxii_lcell
-- Equation(s):
-- \unit_control|Selector8~1_combout\ = ((!\unit_control|state.SUB~regout\ & (\unit_control|regSource\(1) & !\unit_control|state.ADD~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0030",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \unit_control|state.SUB~regout\,
	datac => \unit_control|regSource\(1),
	datad => \unit_control|state.ADD~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|Selector8~1_combout\);

-- Location: LC_X14_Y7_N8
\unit_control|WideOr5\ : maxii_lcell
-- Equation(s):
-- \unit_control|WideOr5~combout\ = (\unit_control|state.XCHG_3~regout\) # ((\unit_control|state.MOVI~regout\) # ((!\unit_control|WideOr5~3_combout\) # (!\unit_control|state.DECODE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "efff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \unit_control|state.XCHG_3~regout\,
	datab => \unit_control|state.MOVI~regout\,
	datac => \unit_control|state.DECODE~regout\,
	datad => \unit_control|WideOr5~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|WideOr5~combout\);

-- Location: LC_X14_Y7_N3
\unit_control|Rout[2]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rout\(2) = DFFEAS((!\unit_control|WideOr5~combout\ & ((\unit_control|Selector7~0\) # ((!\unit_control|regSource\(0) & \unit_control|Selector8~1_combout\)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00dc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|regSource\(0),
	datab => \unit_control|Selector7~0\,
	datac => \unit_control|Selector8~1_combout\,
	datad => \unit_control|WideOr5~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rout\(2));

-- Location: LC_X13_Y7_N4
\unit_control|Selector6~0\ : maxii_lcell
-- Equation(s):
-- \unit_control|Selector6~0_combout\ = (\unit_control|WideOr6~0_combout\ & (\unit_control|regTarget\(0) & (!\unit_control|regTarget\(1)))) # (!\unit_control|WideOr6~0_combout\ & (((\unit_control|regSource\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "22f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \unit_control|regTarget\(0),
	datab => \unit_control|regTarget\(1),
	datac => \unit_control|regSource\(1),
	datad => \unit_control|WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|Selector6~0_combout\);

-- Location: LC_X13_Y7_N5
\unit_control|Rout[1]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rout\(1) = DFFEAS((!\unit_control|WideOr5~combout\ & ((\unit_control|WideOr6~0_combout\ & ((\unit_control|Selector6~0_combout\))) # (!\unit_control|WideOr6~0_combout\ & (\unit_control|regSource\(0) & !\unit_control|Selector6~0_combout\)))), 
-- GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00a4",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|WideOr6~0_combout\,
	datab => \unit_control|regSource\(0),
	datac => \unit_control|Selector6~0_combout\,
	datad => \unit_control|WideOr5~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rout\(1));

-- Location: LC_X15_Y7_N8
\unit_control|regDest[1]\ : maxii_lcell
-- Equation(s):
-- \unit_control|regDest\(1) = DFFEAS(((\unit_control|state.XCHG_3~regout\ & (\Data~combout\(19))) # (!\unit_control|state.XCHG_3~regout\ & ((\Data~combout\(21))))), GLOBAL(\Clock~combout\), VCC, , \unit_control|WideOr4~0\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aacc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(19),
	datab => \Data~combout\(21),
	datad => \unit_control|state.XCHG_3~regout\,
	aclr => GND,
	ena => \unit_control|WideOr4~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|regDest\(1));

-- Location: LC_X15_Y7_N7
\unit_control|regDest[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|regDest\(0) = DFFEAS(((\unit_control|state.XCHG_3~regout\ & ((\Data~combout\(18)))) # (!\unit_control|state.XCHG_3~regout\ & (\Data~combout\(20)))), GLOBAL(\Clock~combout\), VCC, , \unit_control|WideOr4~0\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ccaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(20),
	datab => \Data~combout\(18),
	datad => \unit_control|state.XCHG_3~regout\,
	aclr => GND,
	ena => \unit_control|WideOr4~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|regDest\(0));

-- Location: LC_X15_Y7_N5
\unit_control|Rin[2]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rin\(2) = DFFEAS((\unit_control|regDest\(1) & (((!\unit_control|regDest\(0) & \unit_control|WideOr4~0\)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|regDest\(1),
	datac => \unit_control|regDest\(0),
	datad => \unit_control|WideOr4~0\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rin\(2));

-- Location: LC_X15_Y4_N1
\reg2|Q[0]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(0) = DFFEAS((\BusWires[0]~0\), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \BusWires[0]~0\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(0));

-- Location: LC_X15_Y7_N0
\unit_control|Rin[1]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rin\(1) = DFFEAS(((\unit_control|regDest\(0) & (\unit_control|WideOr4~0\ & !\unit_control|regDest\(1)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \unit_control|regDest\(0),
	datac => \unit_control|WideOr4~0\,
	datad => \unit_control|regDest\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rin\(1));

-- Location: LC_X15_Y4_N5
\reg1|Q[0]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[0]~17\ = (\unit_control|Rout\(2) & (\reg2|Q\(0) & ((C2_Q[0]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[0])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[0]~0\,
	datad => \reg2|Q\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[0]~17\,
	regout => \reg1|Q\(0));

-- Location: LC_X16_Y7_N6
\unit_control|Rtempout[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rtempout\(0) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , , \unit_control|state.ARITH_OUT~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \unit_control|state.ARITH_OUT~regout\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rtempout\(0));

-- Location: LC_X14_Y7_N5
\unit_control|Rtempin[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rtempin\(0) = DFFEAS((\unit_control|state.ADDI~regout\) # ((\unit_control|state.ADD~regout\) # ((\unit_control|state.SUBI~regout\) # (\unit_control|state.SUB~regout\))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.ADDI~regout\,
	datab => \unit_control|state.ADD~regout\,
	datac => \unit_control|state.SUBI~regout\,
	datad => \unit_control|state.SUB~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rtempin\(0));

-- Location: LC_X15_Y3_N9
\regtemp0|Q[0]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[0]~18\ = (((C6_Q[0]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[0]~0\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[0]~18\,
	regout => \regtemp0|Q\(0));

-- Location: LC_X14_Y7_N2
\unit_control|Imedout\ : maxii_lcell
-- Equation(s):
-- \unit_control|Imedout~regout\ = DFFEAS((\unit_control|state.SUBI~regout\) # ((\unit_control|state.ADDI~regout\) # ((\unit_control|state.MOVI~regout\))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fefe",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|state.SUBI~regout\,
	datab => \unit_control|state.ADDI~regout\,
	datac => \unit_control|state.MOVI~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Imedout~regout\);

-- Location: PIN_M15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(0),
	combout => \Data~combout\(0));

-- Location: LC_X13_Y7_N0
\unit_control|Selector5~0\ : maxii_lcell
-- Equation(s):
-- \unit_control|Selector5~0_combout\ = (\unit_control|WideOr6~0_combout\ & (!\unit_control|regTarget\(0) & (!\unit_control|regTarget\(1)))) # (!\unit_control|WideOr6~0_combout\ & (((\unit_control|regSource\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "11f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \unit_control|regTarget\(0),
	datab => \unit_control|regTarget\(1),
	datac => \unit_control|regSource\(1),
	datad => \unit_control|WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \unit_control|Selector5~0_combout\);

-- Location: LC_X13_Y7_N9
\unit_control|Rout[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rout\(0) = DFFEAS((!\unit_control|WideOr5~combout\ & ((\unit_control|WideOr6~0_combout\ & ((\unit_control|Selector5~0_combout\))) # (!\unit_control|WideOr6~0_combout\ & (!\unit_control|regSource\(0) & !\unit_control|Selector5~0_combout\)))), 
-- GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00a1",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|WideOr6~0_combout\,
	datab => \unit_control|regSource\(0),
	datac => \unit_control|Selector5~0_combout\,
	datad => \unit_control|WideOr5~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rout\(0));

-- Location: LC_X15_Y7_N1
\unit_control|Rin[0]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rin\(0) = DFFEAS(((!\unit_control|regDest\(0) & (\unit_control|WideOr4~0\ & !\unit_control|regDest\(1)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0030",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \unit_control|regDest\(0),
	datac => \unit_control|WideOr4~0\,
	datad => \unit_control|regDest\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rin\(0));

-- Location: LC_X15_Y3_N5
\reg0|Q[0]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[0]~19\ = (\unit_control|Imedout~regout\ & (\Data~combout\(0) & ((C1_Q[0]) # (!\unit_control|Rout\(0))))) # (!\unit_control|Imedout~regout\ & (((C1_Q[0]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Imedout~regout\,
	datab => \Data~combout\(0),
	datac => \BusWires[0]~0\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[0]~19\,
	regout => \reg0|Q\(0));

-- Location: LC_X14_Y7_N0
\unit_control|Rout[3]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rout\(3) = DFFEAS((!\unit_control|WideOr5~combout\ & ((\unit_control|Selector8~0\) # ((\unit_control|regSource\(0) & \unit_control|Selector8~1_combout\)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ec",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|regSource\(0),
	datab => \unit_control|Selector8~0\,
	datac => \unit_control|Selector8~1_combout\,
	datad => \unit_control|WideOr5~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rout\(3));

-- Location: LC_X15_Y6_N2
\tri_rtemp0|F[0]~21\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[0]~21_combout\ = (\unit_control|Rout\(0)) # ((\unit_control|Imedout~regout\) # ((\unit_control|Rout\(2)) # (\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \unit_control|Rout\(0),
	datab => \unit_control|Imedout~regout\,
	datac => \unit_control|Rout\(2),
	datad => \unit_control|Rout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[0]~21_combout\);

-- Location: LC_X16_Y7_N7
\unit_control|Rsysout\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[0]~22\ = (\unit_control|Rtempout\(0)) # ((\tri_rtemp0|F[0]~21_combout\) # ((E1_Rsysout) # (\unit_control|Rout\(3))))
-- \unit_control|Rsysout~regout\ = DFFEAS(\tri_rtemp0|F[0]~22\, GLOBAL(\Clock~combout\), VCC, , , \unit_control|state.XCHG_3~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rtempout\(0),
	datab => \tri_rtemp0|F[0]~21_combout\,
	datac => \unit_control|state.XCHG_3~regout\,
	datad => \unit_control|Rout\(3),
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[0]~22\,
	regout => \unit_control|Rsysout~regout\);

-- Location: LC_X16_Y4_N3
\regsys|Q[0]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(0) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[0]~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[0]~0\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(0));

-- Location: LC_X15_Y7_N2
\unit_control|Rin[3]\ : maxii_lcell
-- Equation(s):
-- \unit_control|Rin\(3) = DFFEAS(((\unit_control|regDest\(0) & (\unit_control|WideOr4~0\ & \unit_control|regDest\(1)))), GLOBAL(\Clock~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \unit_control|regDest\(0),
	datac => \unit_control|WideOr4~0\,
	datad => \unit_control|regDest\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \unit_control|Rin\(3));

-- Location: LC_X16_Y4_N9
\reg3|Q[0]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[0]~16\ = (\unit_control|Rout\(3) & (C4_Q[0] & ((\regsys|Q\(0)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & (((\regsys|Q\(0))) # (!\unit_control|Rsysout~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f531",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \unit_control|Rsysout~regout\,
	datac => \BusWires[0]~0\,
	datad => \regsys|Q\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[0]~16\,
	regout => \reg3|Q\(0));

-- Location: LC_X15_Y3_N1
\tri_rtemp0|F[0]~20\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[0]~20_combout\ = (\tri_rtemp0|F[0]~17\ & (\tri_rtemp0|F[0]~18\ & (\tri_rtemp0|F[0]~19\ & \tri_rtemp0|F[0]~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[0]~17\,
	datab => \tri_rtemp0|F[0]~18\,
	datac => \tri_rtemp0|F[0]~19\,
	datad => \tri_rtemp0|F[0]~16\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[0]~20_combout\);

-- Location: LC_X16_Y3_N8
\regtemp0|Q[1]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[1]~25\ = (((C6_Q[1]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[1]~1\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[1]~25\,
	regout => \regtemp0|Q\(1));

-- Location: PIN_L11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(1),
	combout => \Data~combout\(1));

-- Location: LC_X16_Y3_N9
\reg0|Q[1]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[1]~26\ = (\Data~combout\(1) & (((C1_Q[1]) # (!\unit_control|Rout\(0))))) # (!\Data~combout\(1) & (!\unit_control|Imedout~regout\ & ((C1_Q[1]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0bb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(1),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[1]~1\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[1]~26\,
	regout => \reg0|Q\(1));

-- Location: LC_X15_Y4_N2
\reg2|Q[1]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(1) = DFFEAS(((\BusWires[1]~1\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[1]~1\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(1));

-- Location: LC_X15_Y4_N6
\reg1|Q[1]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[1]~24\ = (\unit_control|Rout\(2) & (\reg2|Q\(1) & ((C2_Q[1]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[1])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[1]~1\,
	datad => \reg2|Q\(1),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[1]~24\,
	regout => \reg1|Q\(1));

-- Location: LC_X16_Y4_N0
\regsys|Q[1]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(1) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[1]~1\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[1]~1\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(1));

-- Location: LC_X16_Y4_N5
\reg3|Q[1]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[1]~23\ = (\unit_control|Rout\(3) & (C4_Q[1] & ((\regsys|Q\(1)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & ((\regsys|Q\(1)) # ((!\unit_control|Rsysout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \regsys|Q\(1),
	datac => \BusWires[1]~1\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[1]~23\,
	regout => \reg3|Q\(1));

-- Location: LC_X16_Y3_N2
\tri_rtemp0|F[1]~27\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[1]~27_combout\ = (\tri_rtemp0|F[1]~25\ & (\tri_rtemp0|F[1]~26\ & (\tri_rtemp0|F[1]~24\ & \tri_rtemp0|F[1]~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[1]~25\,
	datab => \tri_rtemp0|F[1]~26\,
	datac => \tri_rtemp0|F[1]~24\,
	datad => \tri_rtemp0|F[1]~23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[1]~27_combout\);

-- Location: LC_X16_Y3_N0
\regtemp0|Q[2]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[2]~30\ = (((C6_Q[2]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[2]~2\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[2]~30\,
	regout => \regtemp0|Q\(2));

-- Location: PIN_N15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(2),
	combout => \Data~combout\(2));

-- Location: LC_X16_Y3_N5
\reg0|Q[2]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[2]~31\ = (\unit_control|Rout\(0) & (C1_Q[2] & ((\Data~combout\(2)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & ((\Data~combout\(2)) # ((!\unit_control|Imedout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \Data~combout\(2),
	datac => \BusWires[2]~2\,
	datad => \unit_control|Imedout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[2]~31\,
	regout => \reg0|Q\(2));

-- Location: LC_X15_Y4_N3
\reg2|Q[2]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(2) = DFFEAS((\BusWires[2]~2\), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \BusWires[2]~2\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(2));

-- Location: LC_X15_Y4_N9
\reg1|Q[2]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[2]~29\ = (\unit_control|Rout\(2) & (\reg2|Q\(2) & ((C2_Q[2]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[2])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[2]~2\,
	datad => \reg2|Q\(2),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[2]~29\,
	regout => \reg1|Q\(2));

-- Location: LC_X16_Y4_N8
\regsys|Q[2]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(2) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[2]~2\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[2]~2\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(2));

-- Location: LC_X16_Y4_N1
\reg3|Q[2]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[2]~28\ = (\unit_control|Rout\(3) & (C4_Q[2] & ((\regsys|Q\(2)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & (((\regsys|Q\(2))) # (!\unit_control|Rsysout~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f531",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \unit_control|Rsysout~regout\,
	datac => \BusWires[2]~2\,
	datad => \regsys|Q\(2),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[2]~28\,
	regout => \reg3|Q\(2));

-- Location: LC_X16_Y4_N2
\tri_rtemp0|F[2]~32\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[2]~32_combout\ = (\tri_rtemp0|F[2]~30\ & (\tri_rtemp0|F[2]~31\ & (\tri_rtemp0|F[2]~29\ & \tri_rtemp0|F[2]~28\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[2]~30\,
	datab => \tri_rtemp0|F[2]~31\,
	datac => \tri_rtemp0|F[2]~29\,
	datad => \tri_rtemp0|F[2]~28\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[2]~32_combout\);

-- Location: PIN_L14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(3),
	combout => \Data~combout\(3));

-- Location: LC_X16_Y3_N4
\reg0|Q[3]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[3]~36\ = (\unit_control|Rout\(0) & (C1_Q[3] & ((\Data~combout\(3)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & (((\Data~combout\(3))) # (!\unit_control|Imedout~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f531",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[3]~3\,
	datad => \Data~combout\(3),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[3]~36\,
	regout => \reg0|Q\(3));

-- Location: LC_X15_Y4_N8
\reg2|Q[3]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(3) = DFFEAS(((\BusWires[3]~3\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[3]~3\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(3));

-- Location: LC_X15_Y4_N0
\reg1|Q[3]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[3]~34\ = (\unit_control|Rout\(2) & (\reg2|Q\(3) & ((C2_Q[3]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[3])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[3]~3\,
	datad => \reg2|Q\(3),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[3]~34\,
	regout => \reg1|Q\(3));

-- Location: LC_X14_Y4_N5
\regsys|Q[3]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(3) = DFFEAS(((\BusWires[3]~3\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[3]~3\,
	aclr => GND,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(3));

-- Location: LC_X14_Y4_N2
\reg3|Q[3]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[3]~33\ = (\regsys|Q\(3) & (((C4_Q[3])) # (!\unit_control|Rout\(3)))) # (!\regsys|Q\(3) & (!\unit_control|Rsysout~regout\ & ((C4_Q[3]) # (!\unit_control|Rout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \regsys|Q\(3),
	datab => \unit_control|Rout\(3),
	datac => \BusWires[3]~3\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[3]~33\,
	regout => \reg3|Q\(3));

-- Location: LC_X16_Y3_N6
\regtemp0|Q[3]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[3]~35\ = (((C6_Q[3]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[3]~3\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[3]~35\,
	regout => \regtemp0|Q\(3));

-- Location: LC_X16_Y3_N7
\tri_rtemp0|F[3]~37\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[3]~37_combout\ = (\tri_rtemp0|F[3]~36\ & (\tri_rtemp0|F[3]~34\ & (\tri_rtemp0|F[3]~33\ & \tri_rtemp0|F[3]~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[3]~36\,
	datab => \tri_rtemp0|F[3]~34\,
	datac => \tri_rtemp0|F[3]~33\,
	datad => \tri_rtemp0|F[3]~35\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[3]~37_combout\);

-- Location: LC_X14_Y4_N4
\regsys|Q[4]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(4) = DFFEAS(((\BusWires[4]~4\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[4]~4\,
	aclr => GND,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(4));

-- Location: LC_X14_Y4_N3
\reg3|Q[4]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[4]~38\ = (\regsys|Q\(4) & (((C4_Q[4])) # (!\unit_control|Rout\(3)))) # (!\regsys|Q\(4) & (!\unit_control|Rsysout~regout\ & ((C4_Q[4]) # (!\unit_control|Rout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \regsys|Q\(4),
	datab => \unit_control|Rout\(3),
	datac => \BusWires[4]~4\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[4]~38\,
	regout => \reg3|Q\(4));

-- Location: LC_X14_Y5_N1
\regtemp0|Q[4]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[4]~40\ = (((C6_Q[4]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[4]~4\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[4]~40\,
	regout => \regtemp0|Q\(4));

-- Location: LC_X15_Y5_N7
\reg2|Q[4]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(4) = DFFEAS(((\BusWires[4]~4\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[4]~4\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(4));

-- Location: LC_X14_Y5_N4
\reg1|Q[4]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[4]~39\ = (\reg2|Q\(4) & (((C2_Q[4])) # (!\unit_control|Rout\(1)))) # (!\reg2|Q\(4) & (!\unit_control|Rout\(2) & ((C2_Q[4]) # (!\unit_control|Rout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \reg2|Q\(4),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[4]~4\,
	datad => \unit_control|Rout\(2),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[4]~39\,
	regout => \reg1|Q\(4));

-- Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(4),
	combout => \Data~combout\(4));

-- Location: LC_X16_Y6_N3
\reg0|Q[4]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[4]~41\ = (\Data~combout\(4) & (((C1_Q[4]) # (!\unit_control|Rout\(0))))) # (!\Data~combout\(4) & (!\unit_control|Imedout~regout\ & ((C1_Q[4]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0bb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(4),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[4]~4\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[4]~41\,
	regout => \reg0|Q\(4));

-- Location: LC_X14_Y5_N8
\tri_rtemp0|F[4]~42\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[4]~42_combout\ = (\tri_rtemp0|F[4]~38\ & (\tri_rtemp0|F[4]~40\ & (\tri_rtemp0|F[4]~39\ & \tri_rtemp0|F[4]~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[4]~38\,
	datab => \tri_rtemp0|F[4]~40\,
	datac => \tri_rtemp0|F[4]~39\,
	datad => \tri_rtemp0|F[4]~41\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[4]~42_combout\);

-- Location: LC_X14_Y6_N2
\reg2|Q[5]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(5) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), \BusWires[5]~5\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[5]~5\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(5));

-- Location: LC_X14_Y6_N5
\reg1|Q[5]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[5]~44\ = (\unit_control|Rout\(2) & (\reg2|Q\(5) & ((C2_Q[5]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[5])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[5]~5\,
	datad => \reg2|Q\(5),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[5]~44\,
	regout => \reg1|Q\(5));

-- Location: LC_X14_Y5_N7
\regtemp0|Q[5]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[5]~45\ = (((C6_Q[5]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[5]~5\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[5]~45\,
	regout => \regtemp0|Q\(5));

-- Location: LC_X14_Y4_N8
\regsys|Q[5]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(5) = DFFEAS(((\BusWires[5]~5\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[5]~5\,
	aclr => GND,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(5));

-- Location: LC_X14_Y4_N1
\reg3|Q[5]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[5]~43\ = (\regsys|Q\(5) & (((C4_Q[5]) # (!\unit_control|Rout\(3))))) # (!\regsys|Q\(5) & (!\unit_control|Rsysout~regout\ & ((C4_Q[5]) # (!\unit_control|Rout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0bb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \regsys|Q\(5),
	datab => \unit_control|Rsysout~regout\,
	datac => \BusWires[5]~5\,
	datad => \unit_control|Rout\(3),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[5]~43\,
	regout => \reg3|Q\(5));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(5),
	combout => \Data~combout\(5));

-- Location: LC_X16_Y6_N1
\reg0|Q[5]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[5]~46\ = (\Data~combout\(5) & (((C1_Q[5]) # (!\unit_control|Rout\(0))))) # (!\Data~combout\(5) & (!\unit_control|Imedout~regout\ & ((C1_Q[5]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0bb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(5),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[5]~5\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[5]~46\,
	regout => \reg0|Q\(5));

-- Location: LC_X14_Y5_N3
\tri_rtemp0|F[5]~47\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[5]~47_combout\ = (\tri_rtemp0|F[5]~44\ & (\tri_rtemp0|F[5]~45\ & (\tri_rtemp0|F[5]~43\ & \tri_rtemp0|F[5]~46\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[5]~44\,
	datab => \tri_rtemp0|F[5]~45\,
	datac => \tri_rtemp0|F[5]~43\,
	datad => \tri_rtemp0|F[5]~46\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[5]~47_combout\);

-- Location: LC_X14_Y5_N6
\regtemp0|Q[6]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[6]~50\ = (((C6_Q[6]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[6]~6\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[6]~50\,
	regout => \regtemp0|Q\(6));

-- Location: LC_X15_Y5_N1
\reg2|Q[6]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(6) = DFFEAS((((\BusWires[6]~6\))), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datad => \BusWires[6]~6\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(6));

-- Location: LC_X14_Y5_N2
\reg1|Q[6]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[6]~49\ = (\reg2|Q\(6) & (((C2_Q[6])) # (!\unit_control|Rout\(1)))) # (!\reg2|Q\(6) & (!\unit_control|Rout\(2) & ((C2_Q[6]) # (!\unit_control|Rout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \reg2|Q\(6),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[6]~6\,
	datad => \unit_control|Rout\(2),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[6]~49\,
	regout => \reg1|Q\(6));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(6),
	combout => \Data~combout\(6));

-- Location: LC_X16_Y6_N6
\reg0|Q[6]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[6]~51\ = (\unit_control|Rout\(0) & (C1_Q[6] & ((\Data~combout\(6)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & (((\Data~combout\(6))) # (!\unit_control|Imedout~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f531",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[6]~6\,
	datad => \Data~combout\(6),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[6]~51\,
	regout => \reg0|Q\(6));

-- Location: LC_X13_Y6_N1
\regsys|Q[6]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(6) = DFFEAS(((\BusWires[6]~6\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[6]~6\,
	aclr => GND,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(6));

-- Location: LC_X13_Y6_N5
\reg3|Q[6]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[6]~48\ = (\unit_control|Rout\(3) & (C4_Q[6] & ((\regsys|Q\(6)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & ((\regsys|Q\(6)) # ((!\unit_control|Rsysout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \regsys|Q\(6),
	datac => \BusWires[6]~6\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[6]~48\,
	regout => \reg3|Q\(6));

-- Location: LC_X14_Y5_N9
\tri_rtemp0|F[6]~52\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[6]~52_combout\ = (\tri_rtemp0|F[6]~50\ & (\tri_rtemp0|F[6]~49\ & (\tri_rtemp0|F[6]~51\ & \tri_rtemp0|F[6]~48\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[6]~50\,
	datab => \tri_rtemp0|F[6]~49\,
	datac => \tri_rtemp0|F[6]~51\,
	datad => \tri_rtemp0|F[6]~48\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[6]~52_combout\);

-- Location: PIN_K15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(7),
	combout => \Data~combout\(7));

-- Location: LC_X15_Y6_N4
\reg0|Q[7]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[7]~56\ = (\unit_control|Rout\(0) & (C1_Q[7] & ((\Data~combout\(7)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & ((\Data~combout\(7)) # ((!\unit_control|Imedout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \Data~combout\(7),
	datac => \BusWires[7]~7\,
	datad => \unit_control|Imedout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[7]~56\,
	regout => \reg0|Q\(7));

-- Location: LC_X14_Y6_N3
\reg2|Q[7]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(7) = DFFEAS((((\BusWires[7]~7\))), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datad => \BusWires[7]~7\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(7));

-- Location: LC_X14_Y6_N4
\reg1|Q[7]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[7]~54\ = (\unit_control|Rout\(2) & (\reg2|Q\(7) & ((C2_Q[7]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[7])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[7]~7\,
	datad => \reg2|Q\(7),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[7]~54\,
	regout => \reg1|Q\(7));

-- Location: LC_X13_Y6_N2
\regsys|Q[7]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(7) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[7]~7\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[7]~7\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(7));

-- Location: LC_X13_Y6_N8
\reg3|Q[7]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[7]~53\ = (\unit_control|Rout\(3) & (C4_Q[7] & ((\regsys|Q\(7)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & ((\regsys|Q\(7)) # ((!\unit_control|Rsysout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \regsys|Q\(7),
	datac => \BusWires[7]~7\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[7]~53\,
	regout => \reg3|Q\(7));

-- Location: LC_X15_Y6_N1
\regtemp0|Q[7]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[7]~55\ = (((C6_Q[7]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[7]~7\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[7]~55\,
	regout => \regtemp0|Q\(7));

-- Location: LC_X15_Y6_N7
\tri_rtemp0|F[7]~57\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[7]~57_combout\ = (\tri_rtemp0|F[7]~56\ & (\tri_rtemp0|F[7]~54\ & (\tri_rtemp0|F[7]~53\ & \tri_rtemp0|F[7]~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[7]~56\,
	datab => \tri_rtemp0|F[7]~54\,
	datac => \tri_rtemp0|F[7]~53\,
	datad => \tri_rtemp0|F[7]~55\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[7]~57_combout\);

-- Location: LC_X13_Y6_N9
\regsys|Q[8]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(8) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[8]~8\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[8]~8\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(8));

-- Location: LC_X13_Y6_N3
\reg3|Q[8]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[8]~58\ = (\unit_control|Rout\(3) & (C4_Q[8] & ((\regsys|Q\(8)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & ((\regsys|Q\(8)) # ((!\unit_control|Rsysout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \regsys|Q\(8),
	datac => \BusWires[8]~8\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[8]~58\,
	regout => \reg3|Q\(8));

-- Location: LC_X14_Y6_N9
\reg2|Q[8]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(8) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), \BusWires[8]~8\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[8]~8\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(8));

-- Location: LC_X14_Y6_N7
\reg1|Q[8]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[8]~59\ = (\unit_control|Rout\(2) & (\reg2|Q\(8) & ((C2_Q[8]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[8])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[8]~8\,
	datad => \reg2|Q\(8),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[8]~59\,
	regout => \reg1|Q\(8));

-- Location: LC_X15_Y6_N0
\regtemp0|Q[8]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[8]~60\ = (((C6_Q[8]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[8]~8\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[8]~60\,
	regout => \regtemp0|Q\(8));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(8),
	combout => \Data~combout\(8));

-- Location: LC_X15_Y6_N5
\reg0|Q[8]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[8]~61\ = (\unit_control|Rout\(0) & (C1_Q[8] & ((\Data~combout\(8)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & ((\Data~combout\(8)) # ((!\unit_control|Imedout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \Data~combout\(8),
	datac => \BusWires[8]~8\,
	datad => \unit_control|Imedout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[8]~61\,
	regout => \reg0|Q\(8));

-- Location: LC_X15_Y6_N6
\tri_rtemp0|F[8]~62\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[8]~62_combout\ = (\tri_rtemp0|F[8]~58\ & (\tri_rtemp0|F[8]~59\ & (\tri_rtemp0|F[8]~60\ & \tri_rtemp0|F[8]~61\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[8]~58\,
	datab => \tri_rtemp0|F[8]~59\,
	datac => \tri_rtemp0|F[8]~60\,
	datad => \tri_rtemp0|F[8]~61\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[8]~62_combout\);

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(9),
	combout => \Data~combout\(9));

-- Location: LC_X16_Y6_N4
\reg0|Q[9]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[9]~66\ = (\Data~combout\(9) & (((C1_Q[9]) # (!\unit_control|Rout\(0))))) # (!\Data~combout\(9) & (!\unit_control|Imedout~regout\ & ((C1_Q[9]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0bb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(9),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[9]~9\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[9]~66\,
	regout => \reg0|Q\(9));

-- Location: LC_X14_Y6_N8
\reg2|Q[9]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(9) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), \BusWires[9]~9\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[9]~9\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(9));

-- Location: LC_X14_Y6_N0
\reg1|Q[9]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[9]~64\ = (\unit_control|Rout\(2) & (\reg2|Q\(9) & ((C2_Q[9]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[9])) # (!\unit_control|Rout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[9]~9\,
	datad => \reg2|Q\(9),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[9]~64\,
	regout => \reg1|Q\(9));

-- Location: LC_X13_Y6_N7
\regsys|Q[9]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(9) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[9]~9\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[9]~9\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(9));

-- Location: LC_X13_Y6_N4
\reg3|Q[9]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[9]~63\ = (\unit_control|Rout\(3) & (C4_Q[9] & ((\regsys|Q\(9)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & ((\regsys|Q\(9)) # ((!\unit_control|Rsysout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \regsys|Q\(9),
	datac => \BusWires[9]~9\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[9]~63\,
	regout => \reg3|Q\(9));

-- Location: LC_X16_Y6_N8
\regtemp0|Q[9]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[9]~65\ = (((C6_Q[9]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[9]~9\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[9]~65\,
	regout => \regtemp0|Q\(9));

-- Location: LC_X16_Y6_N9
\tri_rtemp0|F[9]~67\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[9]~67_combout\ = (\tri_rtemp0|F[9]~66\ & (\tri_rtemp0|F[9]~64\ & (\tri_rtemp0|F[9]~63\ & \tri_rtemp0|F[9]~65\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[9]~66\,
	datab => \tri_rtemp0|F[9]~64\,
	datac => \tri_rtemp0|F[9]~63\,
	datad => \tri_rtemp0|F[9]~65\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[9]~67_combout\);

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(10),
	combout => \Data~combout\(10));

-- Location: LC_X15_Y6_N3
\reg0|Q[10]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[10]~71\ = (\unit_control|Rout\(0) & (C1_Q[10] & ((\Data~combout\(10)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & ((\Data~combout\(10)) # ((!\unit_control|Imedout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \Data~combout\(10),
	datac => \BusWires[10]~10\,
	datad => \unit_control|Imedout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[10]~71\,
	regout => \reg0|Q\(10));

-- Location: LC_X15_Y6_N9
\regtemp0|Q[10]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[10]~70\ = (((C6_Q[10]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[10]~10\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[10]~70\,
	regout => \regtemp0|Q\(10));

-- Location: LC_X14_Y6_N1
\reg2|Q[10]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(10) = DFFEAS((\BusWires[10]~10\), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \BusWires[10]~10\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(10));

-- Location: LC_X14_Y6_N6
\reg1|Q[10]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[10]~69\ = (\unit_control|Rout\(2) & (\reg2|Q\(10) & ((C2_Q[10]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[10]) # (!\unit_control|Rout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \reg2|Q\(10),
	datac => \BusWires[10]~10\,
	datad => \unit_control|Rout\(1),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[10]~69\,
	regout => \reg1|Q\(10));

-- Location: LC_X16_Y5_N1
\regsys|Q[10]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(10) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[10]~10\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[10]~10\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(10));

-- Location: LC_X16_Y5_N2
\reg3|Q[10]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[10]~68\ = (\unit_control|Rsysout~regout\ & (\regsys|Q\(10) & ((C4_Q[10]) # (!\unit_control|Rout\(3))))) # (!\unit_control|Rsysout~regout\ & (((C4_Q[10])) # (!\unit_control|Rout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rsysout~regout\,
	datab => \unit_control|Rout\(3),
	datac => \BusWires[10]~10\,
	datad => \regsys|Q\(10),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[10]~68\,
	regout => \reg3|Q\(10));

-- Location: LC_X15_Y6_N8
\tri_rtemp0|F[10]~72\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[10]~72_combout\ = (\tri_rtemp0|F[10]~71\ & (\tri_rtemp0|F[10]~70\ & (\tri_rtemp0|F[10]~69\ & \tri_rtemp0|F[10]~68\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[10]~71\,
	datab => \tri_rtemp0|F[10]~70\,
	datac => \tri_rtemp0|F[10]~69\,
	datad => \tri_rtemp0|F[10]~68\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[10]~72_combout\);

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(11),
	combout => \Data~combout\(11));

-- Location: LC_X16_Y6_N0
\reg0|Q[11]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[11]~76\ = (\Data~combout\(11) & (((C1_Q[11]) # (!\unit_control|Rout\(0))))) # (!\Data~combout\(11) & (!\unit_control|Imedout~regout\ & ((C1_Q[11]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0bb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \Data~combout\(11),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[11]~11\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[11]~76\,
	regout => \reg0|Q\(11));

-- Location: LC_X15_Y5_N2
\reg2|Q[11]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(11) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), \BusWires[11]~11\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[11]~11\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(11));

-- Location: LC_X15_Y5_N4
\reg1|Q[11]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[11]~74\ = (\unit_control|Rout\(2) & (\reg2|Q\(11) & ((C2_Q[11]) # (!\unit_control|Rout\(1))))) # (!\unit_control|Rout\(2) & (((C2_Q[11]) # (!\unit_control|Rout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(2),
	datab => \reg2|Q\(11),
	datac => \BusWires[11]~11\,
	datad => \unit_control|Rout\(1),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[11]~74\,
	regout => \reg1|Q\(11));

-- Location: LC_X16_Y5_N8
\regsys|Q[11]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(11) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[11]~11\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[11]~11\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(11));

-- Location: LC_X16_Y5_N5
\reg3|Q[11]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[11]~73\ = (\unit_control|Rsysout~regout\ & (\regsys|Q\(11) & ((C4_Q[11]) # (!\unit_control|Rout\(3))))) # (!\unit_control|Rsysout~regout\ & (((C4_Q[11])) # (!\unit_control|Rout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f351",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rsysout~regout\,
	datab => \unit_control|Rout\(3),
	datac => \BusWires[11]~11\,
	datad => \regsys|Q\(11),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[11]~73\,
	regout => \reg3|Q\(11));

-- Location: LC_X16_Y6_N5
\regtemp0|Q[11]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[11]~75\ = (((C6_Q[11]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[11]~11\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[11]~75\,
	regout => \regtemp0|Q\(11));

-- Location: LC_X16_Y5_N7
\tri_rtemp0|F[11]~77\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[11]~77_combout\ = (\tri_rtemp0|F[11]~76\ & (\tri_rtemp0|F[11]~74\ & (\tri_rtemp0|F[11]~73\ & \tri_rtemp0|F[11]~75\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[11]~76\,
	datab => \tri_rtemp0|F[11]~74\,
	datac => \tri_rtemp0|F[11]~73\,
	datad => \tri_rtemp0|F[11]~75\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[11]~77_combout\);

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(12),
	combout => \Data~combout\(12));

-- Location: LC_X16_Y6_N2
\reg0|Q[12]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[12]~81\ = (\unit_control|Rout\(0) & (C1_Q[12] & ((\Data~combout\(12)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & (((\Data~combout\(12))) # (!\unit_control|Imedout~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f531",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \unit_control|Imedout~regout\,
	datac => \BusWires[12]~12\,
	datad => \Data~combout\(12),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[12]~81\,
	regout => \reg0|Q\(12));

-- Location: LC_X15_Y5_N9
\reg2|Q[12]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(12) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), \BusWires[12]~12\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[12]~12\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(12));

-- Location: LC_X15_Y5_N6
\reg1|Q[12]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[12]~79\ = (\unit_control|Rout\(1) & (C2_Q[12] & ((\reg2|Q\(12)) # (!\unit_control|Rout\(2))))) # (!\unit_control|Rout\(1) & (((\reg2|Q\(12))) # (!\unit_control|Rout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f531",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(1),
	datab => \unit_control|Rout\(2),
	datac => \BusWires[12]~12\,
	datad => \reg2|Q\(12),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[12]~79\,
	regout => \reg1|Q\(12));

-- Location: LC_X16_Y5_N9
\regsys|Q[12]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(12) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[12]~12\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[12]~12\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(12));

-- Location: LC_X16_Y5_N6
\reg3|Q[12]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[12]~78\ = (\unit_control|Rsysout~regout\ & (\regsys|Q\(12) & ((C4_Q[12]) # (!\unit_control|Rout\(3))))) # (!\unit_control|Rsysout~regout\ & (((C4_Q[12]) # (!\unit_control|Rout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rsysout~regout\,
	datab => \regsys|Q\(12),
	datac => \BusWires[12]~12\,
	datad => \unit_control|Rout\(3),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[12]~78\,
	regout => \reg3|Q\(12));

-- Location: LC_X16_Y6_N7
\regtemp0|Q[12]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[12]~80\ = (((C6_Q[12]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[12]~12\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[12]~80\,
	regout => \regtemp0|Q\(12));

-- Location: LC_X16_Y5_N4
\tri_rtemp0|F[12]~82\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[12]~82_combout\ = (\tri_rtemp0|F[12]~81\ & (\tri_rtemp0|F[12]~79\ & (\tri_rtemp0|F[12]~78\ & \tri_rtemp0|F[12]~80\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[12]~81\,
	datab => \tri_rtemp0|F[12]~79\,
	datac => \tri_rtemp0|F[12]~78\,
	datad => \tri_rtemp0|F[12]~80\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[12]~82_combout\);

-- Location: LC_X16_Y5_N0
\regsys|Q[13]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(13) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[13]~13\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[13]~13\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(13));

-- Location: LC_X16_Y5_N3
\reg3|Q[13]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[13]~83\ = (\unit_control|Rsysout~regout\ & (\regsys|Q\(13) & ((C4_Q[13]) # (!\unit_control|Rout\(3))))) # (!\unit_control|Rsysout~regout\ & (((C4_Q[13]) # (!\unit_control|Rout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rsysout~regout\,
	datab => \regsys|Q\(13),
	datac => \BusWires[13]~13\,
	datad => \unit_control|Rout\(3),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[13]~83\,
	regout => \reg3|Q\(13));

-- Location: LC_X15_Y3_N2
\regtemp0|Q[13]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[13]~85\ = (((C6_Q[13]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[13]~13\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[13]~85\,
	regout => \regtemp0|Q\(13));

-- Location: PIN_L16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(13),
	combout => \Data~combout\(13));

-- Location: LC_X15_Y3_N4
\reg0|Q[13]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[13]~86\ = (\unit_control|Imedout~regout\ & (\Data~combout\(13) & ((C1_Q[13]) # (!\unit_control|Rout\(0))))) # (!\unit_control|Imedout~regout\ & (((C1_Q[13]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Imedout~regout\,
	datab => \Data~combout\(13),
	datac => \BusWires[13]~13\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[13]~86\,
	regout => \reg0|Q\(13));

-- Location: LC_X15_Y5_N5
\reg2|Q[13]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(13) = DFFEAS(((\BusWires[13]~13\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[13]~13\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(13));

-- Location: LC_X15_Y5_N3
\reg1|Q[13]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[13]~84\ = (\reg2|Q\(13) & (((C2_Q[13]) # (!\unit_control|Rout\(1))))) # (!\reg2|Q\(13) & (!\unit_control|Rout\(2) & ((C2_Q[13]) # (!\unit_control|Rout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0bb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \reg2|Q\(13),
	datab => \unit_control|Rout\(2),
	datac => \BusWires[13]~13\,
	datad => \unit_control|Rout\(1),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[13]~84\,
	regout => \reg1|Q\(13));

-- Location: LC_X15_Y3_N0
\tri_rtemp0|F[13]~87\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[13]~87_combout\ = (\tri_rtemp0|F[13]~83\ & (\tri_rtemp0|F[13]~85\ & (\tri_rtemp0|F[13]~86\ & \tri_rtemp0|F[13]~84\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[13]~83\,
	datab => \tri_rtemp0|F[13]~85\,
	datac => \tri_rtemp0|F[13]~86\,
	datad => \tri_rtemp0|F[13]~84\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[13]~87_combout\);

-- Location: LC_X15_Y3_N8
\regtemp0|Q[14]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[14]~90\ = (((C6_Q[14]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[14]~14\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[14]~90\,
	regout => \regtemp0|Q\(14));

-- Location: PIN_L13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(14),
	combout => \Data~combout\(14));

-- Location: LC_X15_Y3_N7
\reg0|Q[14]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[14]~91\ = (\unit_control|Imedout~regout\ & (\Data~combout\(14) & ((C1_Q[14]) # (!\unit_control|Rout\(0))))) # (!\unit_control|Imedout~regout\ & (((C1_Q[14]) # (!\unit_control|Rout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Imedout~regout\,
	datab => \Data~combout\(14),
	datac => \BusWires[14]~14\,
	datad => \unit_control|Rout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[14]~91\,
	regout => \reg0|Q\(14));

-- Location: LC_X14_Y4_N6
\regsys|Q[14]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(14) = DFFEAS((\BusWires[14]~14\), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \BusWires[14]~14\,
	aclr => GND,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(14));

-- Location: LC_X14_Y4_N7
\reg3|Q[14]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[14]~88\ = (\regsys|Q\(14) & (((C4_Q[14])) # (!\unit_control|Rout\(3)))) # (!\regsys|Q\(14) & (!\unit_control|Rsysout~regout\ & ((C4_Q[14]) # (!\unit_control|Rout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \regsys|Q\(14),
	datab => \unit_control|Rout\(3),
	datac => \BusWires[14]~14\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[14]~88\,
	regout => \reg3|Q\(14));

-- Location: LC_X15_Y5_N8
\reg2|Q[14]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(14) = DFFEAS(((\BusWires[14]~14\)), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datab => \BusWires[14]~14\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(14));

-- Location: LC_X15_Y5_N0
\reg1|Q[14]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[14]~89\ = (\unit_control|Rout\(1) & (C2_Q[14] & ((\reg2|Q\(14)) # (!\unit_control|Rout\(2))))) # (!\unit_control|Rout\(1) & (((\reg2|Q\(14))) # (!\unit_control|Rout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f531",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(1),
	datab => \unit_control|Rout\(2),
	datac => \BusWires[14]~14\,
	datad => \reg2|Q\(14),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[14]~89\,
	regout => \reg1|Q\(14));

-- Location: LC_X15_Y3_N6
\tri_rtemp0|F[14]~92\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[14]~92_combout\ = (\tri_rtemp0|F[14]~90\ & (\tri_rtemp0|F[14]~91\ & (\tri_rtemp0|F[14]~88\ & \tri_rtemp0|F[14]~89\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[14]~90\,
	datab => \tri_rtemp0|F[14]~91\,
	datac => \tri_rtemp0|F[14]~88\,
	datad => \tri_rtemp0|F[14]~89\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[14]~92_combout\);

-- Location: LC_X16_Y4_N7
\regsys|Q[15]\ : maxii_lcell
-- Equation(s):
-- \regsys|Q\(15) = DFFEAS(GND, GLOBAL(\Clock~combout\), VCC, , \unit_control|Rsysin~regout\, \BusWires[15]~15\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[15]~15\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rsysin~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \regsys|Q\(15));

-- Location: LC_X16_Y4_N6
\reg3|Q[15]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[15]~93\ = (\unit_control|Rout\(3) & (C4_Q[15] & ((\regsys|Q\(15)) # (!\unit_control|Rsysout~regout\)))) # (!\unit_control|Rout\(3) & ((\regsys|Q\(15)) # ((!\unit_control|Rsysout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(3),
	datab => \regsys|Q\(15),
	datac => \BusWires[15]~15\,
	datad => \unit_control|Rsysout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[15]~93\,
	regout => \reg3|Q\(15));

-- Location: LC_X15_Y4_N4
\reg2|Q[15]\ : maxii_lcell
-- Equation(s):
-- \reg2|Q\(15) = DFFEAS((((\BusWires[15]~15\))), GLOBAL(\Clock~combout\), VCC, , \unit_control|Rin\(2), , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datad => \BusWires[15]~15\,
	aclr => GND,
	ena => \unit_control|Rin\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \reg2|Q\(15));

-- Location: LC_X15_Y4_N7
\reg1|Q[15]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[15]~94\ = (\reg2|Q\(15) & (((C2_Q[15])) # (!\unit_control|Rout\(1)))) # (!\reg2|Q\(15) & (!\unit_control|Rout\(2) & ((C2_Q[15]) # (!\unit_control|Rout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \reg2|Q\(15),
	datab => \unit_control|Rout\(1),
	datac => \BusWires[15]~15\,
	datad => \unit_control|Rout\(2),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[15]~94\,
	regout => \reg1|Q\(15));

-- Location: PIN_L15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Data(15),
	combout => \Data~combout\(15));

-- Location: LC_X16_Y3_N1
\reg0|Q[15]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[15]~96\ = (\unit_control|Rout\(0) & (C1_Q[15] & ((\Data~combout\(15)) # (!\unit_control|Imedout~regout\)))) # (!\unit_control|Rout\(0) & ((\Data~combout\(15)) # ((!\unit_control|Imedout~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	dataa => \unit_control|Rout\(0),
	datab => \Data~combout\(15),
	datac => \BusWires[15]~15\,
	datad => \unit_control|Imedout~regout\,
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[15]~96\,
	regout => \reg0|Q\(15));

-- Location: LC_X16_Y3_N3
\regtemp0|Q[15]\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[15]~95\ = (((C6_Q[15]) # (!\unit_control|Rtempout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clock~combout\,
	datac => \BusWires[15]~15\,
	datad => \unit_control|Rtempout\(0),
	aclr => GND,
	sload => VCC,
	ena => \unit_control|Rtempin\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[15]~95\,
	regout => \regtemp0|Q\(15));

-- Location: LC_X16_Y4_N4
\tri_rtemp0|F[15]~97\ : maxii_lcell
-- Equation(s):
-- \tri_rtemp0|F[15]~97_combout\ = (\tri_rtemp0|F[15]~93\ & (\tri_rtemp0|F[15]~94\ & (\tri_rtemp0|F[15]~96\ & \tri_rtemp0|F[15]~95\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \tri_rtemp0|F[15]~93\,
	datab => \tri_rtemp0|F[15]~94\,
	datac => \tri_rtemp0|F[15]~96\,
	datad => \tri_rtemp0|F[15]~95\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \tri_rtemp0|F[15]~97_combout\);

-- Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(0));

-- Location: PIN_N12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(1));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(2));

-- Location: PIN_F5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(3));

-- Location: PIN_M13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(4));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(5));

-- Location: PIN_R12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(6));

-- Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(7));

-- Location: PIN_T10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(8));

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(9));

-- Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(10));

-- Location: PIN_M12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(11));

-- Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(12));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(13));

-- Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(14));

-- Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r0_stream[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r0_stream(15));

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(0));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(1));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(2));

-- Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(3));

-- Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(4));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(5));

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(6));

-- Location: PIN_M14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(7));

-- Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(8));

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(9));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(10));

-- Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(11));

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(12));

-- Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(13));

-- Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(14));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r1_stream[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r1_stream(15));

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(0));

-- Location: PIN_P10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(1));

-- Location: PIN_M10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(2));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(3));

-- Location: PIN_P8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(4));

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(5));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(6));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(7));

-- Location: PIN_N16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(8));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(9));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(10));

-- Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(11));

-- Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(12));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(13));

-- Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(14));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r2_stream[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r2_stream(15));

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(0));

-- Location: PIN_P14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(1));

-- Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(2));

-- Location: PIN_N10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(3));

-- Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(4));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(5));

-- Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(6));

-- Location: PIN_N11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(7));

-- Location: PIN_P15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(8));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(9));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(10));

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(11));

-- Location: PIN_R16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(12));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(13));

-- Location: PIN_N13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(14));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\r3_stream[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_r3_stream(15));

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(0));

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(1));

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(2));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(3));

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(4));

-- Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(5));

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(6));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(7));

-- Location: PIN_E6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(8));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(9));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(10));

-- Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(11));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(12));

-- Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(13));

-- Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(14));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rsys_stream[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rsys_stream(15));

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(0));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(1));

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(2));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(3));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(4));

-- Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(5));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(6));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(7));

-- Location: PIN_A2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(8));

-- Location: PIN_T15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(9));

-- Location: PIN_P12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(10));

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(11));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(12));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(13));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(14));

-- Location: PIN_M8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp0_stream[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp0_stream(15));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(0));

-- Location: PIN_N5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(1));

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(2));

-- Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(3));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(4));

-- Location: PIN_N14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(5));

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(6));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(7));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(8));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[9]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(9));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[10]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(10));

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[11]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(11));

-- Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[12]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(12));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[13]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(13));

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[14]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(14));

-- Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rtemp1_stream[15]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_rtemp1_stream(15));
END structure;


