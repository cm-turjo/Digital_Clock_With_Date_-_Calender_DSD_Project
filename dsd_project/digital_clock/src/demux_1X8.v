module demux_1X8(
	input val,
	input [2:0] k,
	input clk,
	output reg [2:0] data_out
	);
	
always @(posedge clk)
	begin
		
		case(k)
		
			3'b001: data_out = k;
			
		
		endcase
	end

endmodule