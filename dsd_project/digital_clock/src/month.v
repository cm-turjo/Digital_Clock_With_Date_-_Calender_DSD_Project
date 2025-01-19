module month(
	input clk,
	input load,
	input clear,
	input enable,
	input [3:0] data,// Month is 12 so 4 bits are used.
	output reg [3:0] month,
	output reg [3:0] databus	//It is acting like dataout
	);

wire [3:0] restart, en, ld;	
assign restart = {4{month[3] && month[2] && (~month[1]) && (~month[0])}};	 //12
assign en = {4{enable}};
assign ld = {4{load}};


initial
	begin
		month = 4'h1;
		end

always @ (posedge clk)
	begin		
		month <= (~(restart)) & (month + 1) & (~ld) | (ld & data);		
		end

assign databus = en & month;

endmodule	