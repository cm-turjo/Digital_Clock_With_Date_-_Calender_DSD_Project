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




/*
reg a1,a2,a3,a4,b1,b2,b3,b4,s2,s1,s0,cin;
wire f1,f2,f3,f4,cout;

alu al1(a1 ,a2 ,a3 ,a4 ,b1 ,b2 ,b3 ,b4 ,s2 ,s1 ,s0 ,cin ,f1 ,f2 ,f3 ,f4 ,cout);
*/