module mux21Mem(MemtoReg, q, ans, busW);
input MemtoReg;
input [31:0] q;
input [31:0] ans;
output [31:0] busW;
assign busW = (MemtoReg == 0)?ans:q;
endmodule