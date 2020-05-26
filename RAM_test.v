`timescale 10ns/1ns

module RAM_test;
reg [5:0] address_a;
reg RegWr;
reg [5:0] address_b;
reg [5:0] address_w;
reg [31:0] busW;
reg clk;
wire [31:0] busA;
wire [31:0] busB;
always #5
	clk = ~clk;
myRAM ram(clk, address_a, address_b, address_w, busW, RegWr, busA, busB);
initial
begin
	clk = 0;
	address_w = 6'd4;
	address_a = 6'd2;
	address_b = 6'd3;
	RegWr = 1;
	busW = 31'd3;
	#20 address_a = 6'd4;
end
endmodule