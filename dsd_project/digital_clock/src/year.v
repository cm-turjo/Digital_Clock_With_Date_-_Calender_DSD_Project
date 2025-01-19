module year(
	input clk,
	input load,
	input clear,
	input enable,
	input [7:0] data,  //2 digit year showing , 60 is the max
	output reg [7:0] year,
	output reg [7:0] databus
	);

wire [7:0] restart, en, ld;	
assign restart = {8{(~year[7]) && (~year[6]) && year[5] && year[4] && year[3] && year[2] && (~year[1]) && (~year[0])}};	  //60
assign en = {8{enable}};
assign ld = {8{load}};


initial
	begin
		year = 8'h0;
		end

always @ (posedge clk)
	begin		
		year <= (~(restart)) & (year + 1) & (~ld) | (ld & data);		
		end

assign databus = en & year;

endmodule	