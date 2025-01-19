module second1(
	input clk,
	input load,
	input clear,
	input enable,
	input [5:0] data,
	output reg [5:0] sec,
	output reg [5:0] databus
	);

wire [5:0] restart, en, ld;	
assign restart = {6{sec[5] && sec[4] && sec[3] && (~sec[2]) && sec[1] && sec[0]}};	
assign en = {6{enable}};
assign ld = {6{load}};


initial
	begin
		sec = 6'h0;
		end

always @ (posedge clk)
	begin		
		sec <= ((~restart) & (sec + 1) & (~ld)) | (ld & data);		
		end

assign databus = en & sec;

endmodule	