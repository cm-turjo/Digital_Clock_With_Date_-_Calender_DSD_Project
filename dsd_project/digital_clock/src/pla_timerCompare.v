

module pla_timerCompare (
	input [3:0] gin,
	input Ts,
	input c7,
	input Az,
	input clk,
	output reg [3:0] gout,
	output reg [9:0] T,
	output reg [1:0] s,
	output reg Kc,
	output reg La,
	output reg Lb,
	output reg Ea,
	output reg Lr,
	output reg Er,
	output reg Cc,
	output reg M
	);
	
	
	
	
	
	
	
	
// State 1 ( (~gin[3]) && (~gin[2]) && (~gin[1]) && gin[0] )//1  
// State 2 ( (~gin[3]) && (~gin[2]) && gin[1] && (~gin[0]) )//8
// State 3 ( (~gin[3]) && (~gin[2]) && gin[1] && gin[0] )//9   
// State 4 ( (~gin[3]) && gin[2] && (~gin[1]) && (~gin[0]) )//10   
// State 5 ( (~gin[3]) && gin[2] && (~gin[1]) && gin[0] )//11   
// State 6 ( (~gin[3]) && gin[2] && gin[1] && (~gin[0]) )//12    
// State 7 ( (~gin[3]) && gin[2] && gin[1] && gin[0] )/13  

// State 8 ( gin[3] && (~gin[2]) && (~gin[1]) && (~gin[0]) )//14    
// State 9 ( gin[3] && (~gin[2]) && (~gin[1]) && gin[0] )//15  
// State 10 ( gin[3] && gin[2] && gin[1] && gin[0] )  


    
	
	

//}} End of automatically maintained section

// Enter your statements here //
always @ (posedge clk) 
	begin 
		gout[3] = ( (~gin[3]) && gin[2] && gin[1] && gin[0] ) ||  ( gin[3] && (~gin[2]) && (~gin[1]) && (~gin[0]) && c7);
		//gout[2] = ( (~gin[2]) && gin[1] && gin[0] ) || ( gin[2] && (~gin[1]) && (~gin[0]) ) || ( gin[2] && (~gin[1]) && gin[0] ) || ( gin[2] && gin[1] && (~gin[0]) );  //3+4+5+6	 
		gout[2] = ( (~gin[3]) && (~gin[2]) && gin[1] && gin[0] )|| ( (~gin[3]) && gin[2] && (~gin[1]) && (~gin[0]) ) || ( (~gin[3]) && gin[2] && (~gin[1]) && gin[0] )|| ( (~gin[3]) && gin[2] && gin[1] && (~gin[0]) && Az );
		//gout[1] = ( (~gin[2]) && (~gin[1]) && gin[0] ) || ( (~gin[2]) && gin[1] && (~gin[0]) ) || ( gin[2] && (~gin[1]) && gin[0] ) || ( gin[2] && gin[1] && (~gin[0]) ) || ( gin[2] && gin[1] && gin[0] );  //1+2+5+6+7
		
		gout[1] = ( (~gin[3]) && (~gin[2]) && (~gin[1]) && gin[0] && Ts )|| ( (~gin[3]) && (~gin[2]) && gin[1] && (~gin[0]) )|| ( (~gin[3]) && gin[2] && (~gin[1]) && gin[0] )|| ( (~gin[3]) && gin[2] && gin[1] && (~gin[0])&& Az );
		//gout[0] = ( (~gin[2]) && gin[1] && (~gin[0]) ) || ( gin[2] && (~gin[1]) && (~gin[0]) ) || ( gin[2] && gin[1] && (~gin[0]) ) || ( gin[2] && gin[1] && gin[0] );  //2+4+6+7	
		
		gout[0]= ( (~gin[3]) && (~gin[2]) && gin[1] && (~gin[0]) )|| ( (~gin[3]) && gin[2] && (~gin[1]) && gin[0] )||  ( (~gin[3]) && gin[2] && gin[1] && (~gin[0]) && Az)|| ( (~gin[3]) && gin[2] && gin[1] && (~gin[0]) && (~Az))||  ( gin[3] && (~gin[2]) && (~gin[1]) && (~gin[0]) && c7)|| ( gin[3] && (~gin[2]) && (~gin[1]) && gin[0] ) ;
		
		s[1] <= ( (~gin[3]) && gin[2] && (~gin[1]) && gin[0] );
		s[0] <= 0; 
		
		Kc <= ((~gin[3]) && (~gin[2]) && gin[1] && (~gin[0]));
		La <= ( (~gin[3]) && (~gin[2]) && gin[1] && gin[0] );
		Lb <= ( (~gin[3]) && gin[2] && (~gin[1]) && (~gin[0]) );
		Ea <= 0;
		Lr <= 0;
		Er <= ((~gin[3]) && (~gin[2]) && gin[1] && gin[0] )|| ( (~gin[3]) && gin[2] && (~gin[1]) && (~gin[0]) );
		Cc <=  ((~gin[3]) && (~gin[2]) && gin[1] && (~gin[0]));
		M <= ( gin[3] && (~gin[2]) && (~gin[1]) && gin[0] );
		//s[0] <= gin[2] && (~gin[1]) && gin[0];  //5
		
		//Kc <= (~gin[2]) && gin[1] && (~gin[0]);  //2
		
		//La <= gin[2] && (~gin[1]) && (~gin[0]); //4 
		//Lb <= (~gin[2]) && gin[1] && gin[0];	 //3
		//Ea <= gin[2] && gin[1] && (~gin[0]);	 //6
		
		//Lr <= gin[2] && gin[1] && (~gin[0]);	 //Ea
		//Er <= (gin[2] && (~gin[1]) && (~gin[0])) || ((~gin[2]) && gin[1] && gin[0]); //La+Lb 
		
	end
	
endmodule