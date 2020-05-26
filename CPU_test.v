`timescale 10ns/1ns

module CPU_test;
reg clk;
reg reset;
wire	ALUsrc;
wire	MemWr;
wire	RegWr;
wire	RegDst;
wire	nPC_sel;
wire	jump;
wire	zero;
wire	[2:0] ALUctrl;
wire	[31:0] ans;
wire [31:0] instr;
wire	[31:0] PC;
//wire	RegDst;
//wire	RegWr;
//wire	ALUsrc;

always #5
	clk = ~clk;
CPU cpu(clk, reset, ALUsrc, MemWr, RegWr, RegDst, nPC_sel, jump, zero, ALUctrl, ans, instr, PC);
initial
begin
	clk = 0;
	
	reset = 0;
	#5
	reset = 1;
	#1000
	reset = 0;
end
endmodule
	
	
	
	
