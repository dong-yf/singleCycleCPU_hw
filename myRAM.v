module myRAM(
input clk,
input [5:0] address_a,
input [5:0] address_b,
input [5:0] address_w,
input [31:0] busW,
input RegWr,
output [31:0] busA,
output [31:0] busB
);
reg [31:0] ram [0:31];
initial
begin
	ram[2] = 31'd1;
	ram[3] = 31'd2;
end
assign busA = ram[address_a];
assign busB = ram[address_b];

always @ (negedge clk)
begin
	if(RegWr)
	begin
		ram[address_w] <= busW;
	end
end
endmodule	
