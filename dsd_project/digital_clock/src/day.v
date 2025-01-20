module day(
	input clk,
	input load,
	input clear,
	input enable,
	input [2:0] data,// 7 Days makes a week
	input hourCount,
	output reg [2:0] day,
	output reg [2:0] databus,	//It is acting like dataout
	output reg dayCount
	);

wire [2:0] restart, en, ld, preset;	
assign restart = {3{day[2] && day[1] && day[0]}};	 //7
assign en = {3{enable}};
assign ld = {3{load}};
assign preset = 3'b001;

assign dayCount = day[2] && day[1] && day[0];

initial
	begin
		day = 3'h1;
		end

always @ (posedge clk)
	begin
		day <= ((~restart) & (day + 1) & (~ld)) | (ld & data) | (restart & preset);
		//day <= ((~restart) & (day + 1) & {3{hourCount}} & (~ld)) | (ld & data) | (restart & preset) | (day & {3{~hourCount}});		
		end

assign databus = en & day;

endmodule		   

