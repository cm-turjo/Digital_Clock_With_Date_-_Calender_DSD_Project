

module pla_timeUpdate (
	input [3:0] gin,
	input u,
	//input k7,
	input clk,
	output reg [3:0] gout,
	output reg [9:0] T,
	output reg [1:0] s,
	output reg Kc,
	output reg La,
	output reg Lb,
	output reg Ea,
	output reg Lr,
	output reg Er
	);
	
	
	
	
	
	
	
	
// State 1 ( (~gin[2]) && (~gin[1]) && gin[0] ) 1
// State 2 ( (~gin[2]) && gin[1] && (~gin[0]) ) 16
// State 3 ( (~gin[2]) && gin[1] && gin[0] )   	17
// State 4 ( gin[2] && (~gin[1]) && (~gin[0]) ) 18
// State 5 ( gin[2] && (~gin[1]) && gin[0] )   	 19
// State 6 ( gin[2] && gin[1] && (~gin[0]) ) 20
// State 7 ( gin[2] && gin[1] && gin[0] )  	   21
    
	
	

//}} End of automatically maintained section

// Enter your statements here //
always @ (posedge clk) 
	begin
		gout[2] = ( (~gin[2]) && gin[1] && gin[0] ) || ( gin[2] && (~gin[1]) && (~gin[0]) ) || ( gin[2] && (~gin[1]) && gin[0] ) || ( gin[2] && gin[1] && (~gin[0]) );  //3+4+5+6
		
		gout[1] = ( (~gin[2]) && (~gin[1]) && gin[0] ) || ( (~gin[2]) && gin[1] && (~gin[0]) ) || ( gin[2] && (~gin[1]) && gin[0] ) || ( gin[2] && gin[1] && (~gin[0]) ) || ( gin[2] && gin[1] && gin[0] && u );  //1+2+5+6+7	
		
		gout[0] = ((~gin[2]) && gin[1] && (~gin[0])) || ( gin[2] && (~gin[1]) && (~gin[0]) ) || ( gin[2] && gin[1] && (~gin[0]) ) || ( gin[2] && gin[1] && gin[0] && (~u) );  //2+4+6+7
		
		s[1] <= 0;
		//s[0] <= gin[2] && (~gin[1]) && gin[0];  //5	
		
		s[0] <= gin[2] && (~gin[1]) && gin[0];//   19
		//gin[2] && (~gin[1]) && gin[0]	  
		
		Kc <= (~gin[2]) && gin[1] && (~gin[0]);	//16
		
		La <= (~gin[2]) && gin[1] && (gin[0] ); //17	
		
		Lb <=  (gin[2]) && (~gin[1]) && (~gin[0]); //18
		
		Ea <= 	gin[2] && gin[1] && (~gin[0]);//20
		
		Lr <=	gin[2] && gin[1] && (~gin[0]); //20
		
		Er <= 	(~gin[2]) && gin[1] && (gin[0] );//17
		
		
	end
	
endmodule