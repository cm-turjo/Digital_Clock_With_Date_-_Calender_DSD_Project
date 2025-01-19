module zero_sign(
	input [5:0]A,
	output reg Az
	);

assign Az = A[5] | A[4] | A[3] | A[2] | A[1];

endmodule
	