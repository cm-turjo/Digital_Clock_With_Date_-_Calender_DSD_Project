module year(
	input clk,
	input load,
	input clear,
	input enable,
	input [5:0] data,  //2 digit year showing , 60 is the max
	input monthCount,
	output reg [5:0] year,
	output reg [5:0] databus,
	output reg yearCount
	);

wire [5:0] restart, en, ld;	
assign restart = {6{ year[5] && year[4] && year[3] && year[2] && (~year[1]) && (~year[0])}};	  //60
assign en = {6{enable}};
assign ld = {6{load}};

assign preset = 6'h1;

assign yearCount = 	year[5] && year[4] && year[3] && year[2] && (~year[1]) && (~year[0]);

initial
	begin
		year = 6'h1;
		end

always @ (posedge clk)
	begin		
		//year <= ((~restart) & (year + 1) & {6{monthCount}} & (~ld)) | (ld & data) | (restart & preset) | (year & {6{~monthCount}});
		year <= ((~restart) & (year + 1) & (~ld)) | (ld & data) | (restart & preset);		
		end

assign databus = en & year;

endmodule	