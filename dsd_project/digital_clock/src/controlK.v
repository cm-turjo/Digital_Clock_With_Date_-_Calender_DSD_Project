 module controlK(
	 input clk,
	 input [2:0] pla,
	 input [2:0] k[2:0],
	 output reg [2:0] regk
	 );

always @ (posedge clk)
	begin
		regk = k[0] & {3{pla[0]}} | k[1] & {3{pla[1]}} | k[2] & {3{pla[2]}};
	end

endmodule