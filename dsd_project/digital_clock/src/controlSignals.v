module controlSignals(
	input clk,
	input [2:0]pla,
	input Ea[2:0],
	input Er[2:0],
	input La[2:0],
	input Lb[2:0],
	input Lr[2:0],
	output reg eA,
	output reg eR,
	output reg lA,
	output reg lB,
	output reg lR
	);

always @ (posedge clk)
	begin
		eA = (pla[2] & Ea[2]) | (pla[1] & Ea[1]) | (pla[0] & Ea[0]);
		eR = (pla[2] & Er[2]) | (pla[1] & Er[1]) | (pla[0] & Er[0]);
		lA = (pla[2] & La[2]) | (pla[1] & La[1]) | (pla[0] & La[0]);
		lB = (pla[2] & Lb[2]) | (pla[1] & Lb[1]) | (pla[0] & Lb[0]);
		lR = (pla[2] & Lr[2]) | (pla[1] & Lr[1]) | (pla[0] & Lr[0]);
	end
	
	endmodule