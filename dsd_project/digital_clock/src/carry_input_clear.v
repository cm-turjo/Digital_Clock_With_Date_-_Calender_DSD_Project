module carry_input_clear(
	input Cin,
	input [2:0]pla,
	output reg Cout
	);

assign Cout = Cin & pla[0] | Cin & pla[1] | Cin & pla[2];

endmodule