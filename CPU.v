// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Full Version"
// CREATED		"Sun May 17 21:01:35 2020"

module CPU(
	clk,
	reset,
	MemWr,
	jump,
	zero,
	ALUsrc,
	RegWr,
	RegDst,
	ALUctrl,
	ans,
	instr,
	PC
);


input wire	clk;
input wire	reset;
output wire	MemWr;
output wire	jump;
output wire	zero;
output wire	ALUsrc;
output wire	RegWr;
output wire	RegDst;
output wire	[2:0] ALUctrl;
output wire	[31:0] ans;
output wire	[31:0] instr;
output wire	[31:0] PC;

wire	[5:0] address_w;
wire	[2:0] ALUctrl_ALTERA_SYNTHESIZED;
wire	ALUsrc_ALTERA_SYNTHESIZED;
wire	[31:0] ans_ALTERA_SYNTHESIZED;
wire	[31:0] busA;
wire	[31:0] busB;
wire	[31:0] busW;
wire	clk1;
wire	[31:0] instr_ALTERA_SYNTHESIZED;
wire	jump_ALTERA_SYNTHESIZED;
wire	MemtoReg;
wire	MemWr_ALTERA_SYNTHESIZED;
wire	nPC_sel;
wire	[31:0] PC_ALTERA_SYNTHESIZED;
wire	[31:0] q;
wire	RegDst_ALTERA_SYNTHESIZED;
wire	RegWr_ALTERA_SYNTHESIZED;
wire	zero_ALTERA_SYNTHESIZED;





PC	b2v_inst(
	.clk(clk),
	.reset(reset),
	.nPC_sel(nPC_sel),
	.zero(zero_ALTERA_SYNTHESIZED),
	.jump(jump_ALTERA_SYNTHESIZED),
	.imm16(instr_ALTERA_SYNTHESIZED[15:0]),
	.imm26(instr_ALTERA_SYNTHESIZED[25:0]),
	.PC(PC_ALTERA_SYNTHESIZED));


myRAM	b2v_inst1(
	.clk(clk),
	.RegWr(RegWr_ALTERA_SYNTHESIZED),
	.address_a(instr_ALTERA_SYNTHESIZED[26:21]),
	.address_b(instr_ALTERA_SYNTHESIZED[21:16]),
	.address_w(address_w),
	.busW(busW),
	.busA(busA),
	.busB(busB));


Control	b2v_inst2(
	.funct(instr_ALTERA_SYNTHESIZED[5:0]),
	.opcode(instr_ALTERA_SYNTHESIZED[31:26]),
	.ALUsrc(ALUsrc_ALTERA_SYNTHESIZED),
	.MemWr(MemWr_ALTERA_SYNTHESIZED),
	.MemtoReg(MemtoReg),
	.RegDst(RegDst_ALTERA_SYNTHESIZED),
	.RegWr(RegWr_ALTERA_SYNTHESIZED),
	.nPC_sel(nPC_sel),
	.jump(jump_ALTERA_SYNTHESIZED),
	.ALUctr(ALUctrl_ALTERA_SYNTHESIZED));


FDIV	b2v_inst3(
	.CLK(clk)
	);


InstrROM	b2v_inst4(
	.clock(clk),
	.address(PC_ALTERA_SYNTHESIZED[7:0]),
	.q(instr_ALTERA_SYNTHESIZED));


ALU	b2v_inst5(
	.ALUsrc(ALUsrc_ALTERA_SYNTHESIZED),
	.ALUctrl(ALUctrl_ALTERA_SYNTHESIZED),
	.busA(busA),
	.busB(busB),
	.imm16(instr_ALTERA_SYNTHESIZED[15:0]),
	.zero(zero_ALTERA_SYNTHESIZED),
	.ans(ans_ALTERA_SYNTHESIZED));


mux21	b2v_inst6(
	.RegDst(RegDst_ALTERA_SYNTHESIZED),
	.Rd(instr_ALTERA_SYNTHESIZED[16:11]),
	.Rt(instr_ALTERA_SYNTHESIZED[21:16]),
	.address_w(address_w));


RAM	b2v_inst7(
	.wren(MemWr_ALTERA_SYNTHESIZED),
	.clock(clk),
	.data(busB),
	.rdaddress(ans_ALTERA_SYNTHESIZED[4:0]),
	.wraddress(ans_ALTERA_SYNTHESIZED[4:0]),
	.q(q));


mux21Mem	b2v_inst9(
	.MemtoReg(MemtoReg),
	.ans(ans_ALTERA_SYNTHESIZED),
	.q(q),
	.busW(busW));

assign	MemWr = MemWr_ALTERA_SYNTHESIZED;
assign	jump = jump_ALTERA_SYNTHESIZED;
assign	zero = zero_ALTERA_SYNTHESIZED;
assign	ALUsrc = ALUsrc_ALTERA_SYNTHESIZED;
assign	RegWr = RegWr_ALTERA_SYNTHESIZED;
assign	RegDst = RegDst_ALTERA_SYNTHESIZED;
assign	ALUctrl = ALUctrl_ALTERA_SYNTHESIZED;
assign	ans = ans_ALTERA_SYNTHESIZED;
assign	instr = instr_ALTERA_SYNTHESIZED;
assign	PC = PC_ALTERA_SYNTHESIZED;

endmodule
