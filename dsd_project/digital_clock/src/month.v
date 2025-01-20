module month(
	input clk,
	input load,
	input clear,
	input enable,
	input [3:0] data,// Month is 12 so 4 bits are used.	
	input dateCount,
	output reg [3:0] month,
	output reg [3:0] databus,	//It is acting like dataout
	output reg monthCount
	);

wire [3:0] restart, en, ld;	
assign restart = {4{month[3] && month[2] && (~month[1]) && (~month[0])}};	 //12
assign en = {4{enable}};
assign ld = {4{load}};
assign preset = 4'b0001;

assign monthCount = month[3] && month[2] && (~month[1]) && (~month[0]);

initial
	begin
		month = 4'h1;
		end

always @ (posedge clk)
	begin		
		// month <= ((~restart) & (month + 1) & {4{dateCount}} & (~ld)) | (ld & data) | (restart & preset) | (month & {3{~monthCount}});
		month <= ((~restart) & (month + 1) & (~ld)) | (ld & data) | (restart & preset);		
		end

assign databus = en & month;

endmodule	