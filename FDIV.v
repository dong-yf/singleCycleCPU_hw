module FDIV(CLK, CLK1);//2500 frequency division
	input CLK;
	output reg CLK1;
	reg [10:0] count;
	always @ (posedge CLK)
	begin
		count <= count + 11'b1;
		if (count == 1250)
		begin
			CLK1 <= ~CLK1;
			count <= 0;
		end
	end
endmodule