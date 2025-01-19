module minute(
	input clk,
	input load,
	input clear,
	input enable,
	input [5:0] data,
	input secCount,
	output reg [5:0] min,
	output reg [5:0] databus,
	output reg minCount
	);

wire [5:0] restart, en, ld;	
assign restart = {6{min[5] && min[4] && min[3] && (~min[2]) && min[1] && min[0]}};	 //59
assign en = {6{enable}};
assign ld = {6{load}};
assign minCount = min[5] && min[4] && min[3] && (~min[2]) && min[1] && min[0];


initial
	begin
		min = 6'h0;
		end

always @ (posedge clk)
	begin		
		min <= ((~restart) & (min + 1) & {6{secCount}} & (~ld)) | (ld & data) | (min & {6{~secCount}});		
		end

assign databus = en & min;

endmodule	