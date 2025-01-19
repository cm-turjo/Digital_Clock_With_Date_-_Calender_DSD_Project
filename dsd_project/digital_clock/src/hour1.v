module hour1(
	input clk,
	input load,
	input clear,
	input enable,
	input [4:0] data,// Hour is 24 Hour Format so After 23 the value will be resetted. so 5 bits are used.
	output reg [4:0] hour,
	output reg [4:0] databus	//It is acting like dataout
	);

wire [4:0] restart, en, ld;	
assign restart = {5{hour[4] && (~hour[3]) && hour[2] && hour[1] && hour[0]}};	 //23
assign en = {5{enable}};
assign ld = {5{load}};


initial
	begin
		hour = 5'h0;
		end

always @ (posedge clk)
	begin		
		hour <= (~(restart)) & (hour + 1) & (~ld) | (ld & data);		
		end

assign databus = en & hour;

endmodule	