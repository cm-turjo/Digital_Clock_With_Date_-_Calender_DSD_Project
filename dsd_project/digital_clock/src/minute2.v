module minute2(
	input clk,
	input load,
	input clear,
	input enable,
	input [5:0] data,
	output reg [5:0] min,
	output reg [5:0] databus
	);

wire [5:0] restart, en, ld;	
assign restart = {6{min[5] && min[4] && min[3] && (~min[2]) && min[1] && min[0]}};	
assign en = {6{enable}};
assign ld = {6{load}};


initial
	begin
		min = 6'h0;
		end

always @ (posedge clk)
	begin		
		min <= ((~restart) & (min + 1) & (~ld)) | (ld & data);		
		end

assign databus = en & min;

endmodule	