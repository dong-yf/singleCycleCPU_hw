module PC(
input clk,
input reset,
input [15:0] imm16,
input [25:0] imm26,
input nPC_sel,
input zero,
input jump,
output reg [31:0] PC
);
wire [31:0]ext_imm = {{16{imm16[15]}}, imm16};

initial
begin
	PC = 0;
end

always @ (posedge clk or negedge reset)
begin
	if(reset == 0)
		PC <= 0;
	else 
	begin
		if(nPC_sel && zero)                
			PC <= (PC + 1 + ext_imm );
		else if(jump) 
			PC <= {PC[31:28], imm26, 2'b00};
		else 
			PC <= PC + 1;
	end
end
		
endmodule