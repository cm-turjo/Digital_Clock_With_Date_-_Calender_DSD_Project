module day(
	input clk,
	input load,
	input clear,
	input enable,
	input [2:0] data,// 7 Days makes a week
	output reg [2:0] day,
	output reg [2:0] databus	//It is acting like dataout
	);

wire [2:0] restart, en, ld;	
assign restart = {3{day[2] && day[1] && (~day[0])}};	 //6
assign en = {3{enable}};
assign ld = {3{load}};


initial
	begin
		day = 3'h0;
		end

always @ (posedge clk)
	begin		
		day <= (~(restart)) & (day + 1) & (~ld) | (ld & data);		
		end

assign databus = en & day;

endmodule	