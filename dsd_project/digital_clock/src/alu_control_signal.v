module alu_control_signal(
	input [2:0] pla,
	input [1:0] s[2:0],
	input clk,
	output reg [1:0] S
	);

//assign S[0] = (s[0][0] && pla[0]) || (s[1][0] && pla[1]) || (s[2][0] && pla[2]);
//assign S[1] = (s[0][1] && pla[0]) || (s[1][1] && pla[1]) || (s[2][1] && pla[2]);



always @ (posedge clk)
	begin
		S[0] <= (s[0][0] && pla[0]) || (s[1][0] && pla[1]) || (s[2][0] && pla[2]);
		S[1] <= (s[0][1] && pla[0]) || (s[1][1] && pla[1]) || (s[2][1] && pla[2]);

	end
endmodule