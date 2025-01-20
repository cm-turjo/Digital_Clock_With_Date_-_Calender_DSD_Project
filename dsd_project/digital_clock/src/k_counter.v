module k_counter(
	input clk,
	input Kc [2:0],
	input [2:0] pla,
	output reg k7,
	output reg [2:0] k[2:0]
	);

initial 
	begin
		k[2] = 3'b000;
		k[1] = 3'b000;
		k[0] = 3'b000;
	end
	

always @(posedge clk)
	begin		 	  
		
		k[0] = ( Kc[0] & pla[0] & (k[0]+1)) | ({1'b0} & (~pla[0])) ;
		k[1] = ( Kc[1] & pla[1] & (k[1]+1)) | ({1'b0} & (~pla[1])) ;
		k[2] = ( Kc[2] & pla[2] & (k[2]+1)) | ({1'b0} & (~pla[2])) ;
		k7 = (k[0][2] & k[0][1] & k[0][0] & pla[0]) | (k[1][2] & k[1][1] & k[1][0] & pla[1]) | (k[2][2] & k[2][1] & k[2][0] & pla[2]);
	end
	
endmodule

											   
