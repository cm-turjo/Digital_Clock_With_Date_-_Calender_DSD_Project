module mux_8X1(
	input clk,
	input eR,
	input lA,
	input lB,
	input [2:0]regk,
	input [5:0]sec,
	input [5:0]min,
	input [5:0]year,
	input [4:0]hour,
	input [4:0]date,
	input [3:0]month,
	input [2:0]day,
	output reg [5:0]A,
	output reg [5:0]B
	);
	
	
	always @(posedge clk)
		begin
			case(regk)
				3'b001 : A = sec & {6{eR}};
				3'b010 : A = min ;
				3'b011 : A = hour;
				3'b100 : A = day;
				3'b101 : A = date;
				3'b110 : A = month;
				3'b111 : A = year;
				default : A = 3'b000;
				endcase
			end
	endmodule