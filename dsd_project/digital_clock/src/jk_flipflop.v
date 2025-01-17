module jk_flipflop(
	input j,
	input k,
	input clk,
	input in,
	output reg q
	);
	
	
always @ (posedge clk)
	begin
		q <= (j & (~in)) | ((~k) & in);
	end
	
endmodule