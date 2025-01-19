module pla_status(
	input t,
	input Ts,
	input u,
	input clk,
	output reg [2:0] pla	
	);

//assign pla[0] = t & (~Ts) & (~u);
//assign pla[1] = (~t) & Ts & (~u);
//assign pla[2] = (~t) & (~Ts) & u;

always @(posedge clk)
	begin 
	 pla[0] = t & (~Ts) & (~u);	  //timer set
	 pla[2] = (~t) & Ts & (~u);	  //timer compare
	 pla[1] = (~t) & (~Ts) & u;	  //time update
	end
endmodule