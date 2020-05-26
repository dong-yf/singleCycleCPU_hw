module mux21(RegDst, Rd, Rt, address_w);
input RegDst;
input [5:0] Rd;
input [5:0] Rt;
output [5:0] address_w;
assign address_w = (RegDst == 0)?Rt:Rd;
endmodule
