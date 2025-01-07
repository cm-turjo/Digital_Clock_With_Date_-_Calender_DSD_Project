`timescale 1ms / 1ms


module breadboard();

reg str_clk, clk;
											 

always @(posedge str_clk)
	begin 
		while(str_clk)
			begin
				clk = 0;
				#1;
				clk = 1;
				#1;
			end
	end

initial
	begin
		str_clk = 0;
		#1; 
		str_clk = 1;
		
		
		#100;
		str_clk = 0;
		
	end

endmodule