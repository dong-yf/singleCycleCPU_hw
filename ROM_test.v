`timescale 10ns/1ns

module ROM_test;
reg clk;
reg [7:0] address;
wire [31:0] q;
integer i;
always #5
	clk = ~clk;
InstrROM rom(address, clk, q);
initial
begin
	clk = 0;
	address = 0;
	for(i = 0; i<8; i = i+1)
	begin
		#10  address = address + 4;
	end
end
endmodule
	
	
	
	
	
	
	