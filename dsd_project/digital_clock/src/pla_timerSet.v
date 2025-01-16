//-----------------------------------------------------------------------------
//
// Title       : pla_timerSet
// Design      : digital_clock
// Author      : Mahbub
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : E:/LAB/DSD/dsd_project/digital_clock/src/pla_timerSet.v
// Generated   : Mon Jan  6 14:57:18 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
					  

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {pla_timerSet}}

module pla_timerSet (
	input [3:0] gin,
	input t,
	input k7,
	input clk,
	output reg [3:0] gout,
	output reg [3:0] T,
	output reg [1:0] s,
	output reg Kc,
	output reg La,
	output reg Lb,
	output reg Ea,
	output reg Lr,
	output reg Er
	);
	
	
	
	
	
	
	
	
// State 1 ( (~gin[2]) && (~gin[1]) && gin[0] )  
// State 2 ( (~gin[2]) && gin[1] && (~gin[0]) )   
// State 3 ( (~gin[2]) && gin[1] && gin[0] )   
// State 4 ( gin[2] && (~gin[1]) && (~gin[0]) )   
// State 5 ( gin[2] && (~gin[1]) && gin[0] )   
// State 6 ( gin[2] && gin[1] && (~gin[0]) )    
// State 7 ( gin[2] && gin[1] && gin[0] )  
    
	
	

//}} End of automatically maintained section

// Enter your statements here //
always @ (posedge clk) 
	begin
		gout[3] <= 0;
		gout[2] <= ( (~gin[2]) && gin[1] && gin[0] ) || ( gin[2] && (~gin[1]) && (~gin[0]) ) || ( gin[2] && (~gin[1]) && gin[0] ) || ( gin[2] && gin[1] && (~gin[0]) );  //3+4+5+6
		gout[1] <= ( t && (~gin[2]) && (~gin[1]) && gin[0] ) || ( (~gin[2]) && gin[1] && (~gin[0]) ) || ( gin[2] && (~gin[1]) && gin[0] ) || ( gin[2] && gin[1] && (~gin[0]) ) || (~k7 && ( gin[2] && gin[1] && gin[0] ));  //1+2+5+6+7
		gout[0] <= ( (~gin[2]) && gin[1] && (~gin[0]) ) || ( gin[2] && (~gin[1]) && (~gin[0]) ) || ( gin[2] && gin[1] && (~gin[0]) ) || (k7 && ( gin[2] && gin[1] && gin[0] ));  //2+4+6+7
		
		s[1] <= 0;
		s[0] <= gin[2] && (~gin[1]) && gin[0];  //5
		
		Kc <= (~gin[2]) && gin[1] && (~gin[0]);  //2
		
		La <= gin[2] && (~gin[1]) && (~gin[0]); //4 
		Lb <= (~gin[2]) && gin[1] && gin[0];	 //3
		Ea <= gin[2] && gin[1] && (~gin[0]);	 //6
		
		Lr <= gin[2] && gin[1] && (~gin[0]);	 //Ea
		Er <= (gin[2] && (~gin[1]) && (~gin[0])) || ((~gin[2]) && gin[1] && gin[0]); //La+Lb 
		
		T <= gin; 
		
		
	end
	
endmodule
