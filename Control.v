module Control(
input [5:0] opcode,
input [5:0] funct,
output reg ALUsrc,
output reg [2:0] ALUctr,
output reg MemWr,
output reg MemtoReg,
output reg RegDst,
output reg RegWr,
output reg nPC_sel,
output reg jump
);
initial
begin
	MemWr <= 0;
end
//MemtoReg
always @ (*)
begin
	case(opcode)
		6'b100011: MemtoReg = 1;
		default: MemtoReg = 0;
	endcase
end
//RegWr
always @ (*)
begin
	case(opcode)
		6'b101011, 6'b000010, 6'b000100: RegWr = 0;  //sw, j, beq
		default: RegWr = 1;
	endcase
end
// RegDst
always @ (*)
begin
	case(opcode)
		6'b100011: RegDst = 0;   //lw
		default: RegDst = 1;
	endcase
end
// MemWr
always @ (*)
begin
	case(opcode)
		6'b101011: MemWr = 1;
		default: MemWr = 0;
	endcase
end
// ALUsrc
always @ (*)
begin
	case(opcode)
		6'b100011, 6'b101011: ALUsrc = 1;  // sw, lw
		default: ALUsrc = 0;
	endcase
end
// jump
always @ (*)
begin
	case(opcode)
		6'b000010: jump = 1;  // jump
		default: jump = 0;
	endcase
end
// nPC_sel
always @ (*)
begin
	case(opcode)
		6'b000100: nPC_sel = 1;  // beq
		default: nPC_sel = 0;
	endcase
end
// ALUctr
always @ (*)
begin
	case(opcode)
		6'b000000:   // R format
		begin
			case(funct)
				6'b100000: ALUctr = 3'b000;  // add
				6'b100011: ALUctr = 3'b001;  // sub
				6'b100100: ALUctr = 3'b010;  // and
				6'b100101: ALUctr = 3'b011;  // or
				6'b101010: ALUctr = 3'b100;  // slt
				default: ALUctr = 3'b000;
			endcase
		end
		6'b000100: ALUctr = 3'b001;  // beq
		6'b100011, 6'b101011: ALUctr = 3'b000;   //lw, sw
		default: ALUctr = 3'b000;
	endcase
end
		
endmodule		
		
		
		
		
		
				