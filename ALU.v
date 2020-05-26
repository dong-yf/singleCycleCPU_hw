module ALU(
input [2:0] ALUctrl,
input [31:0] busA,
input [31:0] busB,
input [15:0] imm16,
input ALUsrc,
output zero,
output reg [31:0] ans
);
assign zero = (ans == 0)?1:0;
wire [31:0]ext_imm = {{16{imm16[15]}}, imm16};

always @(*)
begin
	if(ALUsrc == 1)
		ans = busA + ext_imm;
	else
	begin
		case(ALUctrl)
			3'b000: ans = busA + busB;
			3'b001: ans = busA - busB;
			3'b010: ans = busA & busB;
			3'b011: ans = busA | busB;
			3'b100: ans = busA - busB;
			default: ans = 0;
		endcase
	end
end

endmodule