module date(
	input clk,
	input load,
	input clear,
	input enable,
	input [4:0] data,// 30 Days makes 1 month
	output reg [4:0] date,
	output reg [4:0] databus	//It is acting like dataout
	);

wire [4:0] restart, en, ld, preset;	
assign restart = {5{date[4] && date[3] && date[2] && date[1] && (~date[0])}};	 //30
assign en = {5{enable}};
assign ld = {5{load}}; 
assign preset = {5{(~date[4]) && (~date[3]) && (~date[2]) && (~date[1]) && (~date[0])}};


initial
	begin
		date = 5'h1;
		end

always @ (posedge clk)
	begin		
		date <= ((~restart) & (date + 1) & (~ld)) | (ld & data);		
		end

assign databus = en & date;

endmodule	