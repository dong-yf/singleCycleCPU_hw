`timescale 1ns/1ns

module PC_test;
reg clk;
reg reset;
reg zero;
reg jump;
reg nPC_sel;
reg [15:0] imm16;
reg [25:0] imm26;
wire [31:0] PC;
always #5
	clk = ~clk;
PC pc(clk, reset, imm16, imm26, nPC_sel, zero, jump, PC);
initial 
begin
	clk = 0;
	reset = 0;
	zero = 0;
	jump = 0;
	nPC_sel = 0;
	imm16 = 16'd1;
	imm26 = 26'b0;
	#5
	reset = 1;
	#20
	nPC_sel = 1;
	zero = 1;
	#1000
	reset = 0;
	
end
endmodule
