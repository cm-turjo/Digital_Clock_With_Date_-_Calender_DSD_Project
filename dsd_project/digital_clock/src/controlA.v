			 //-----------------------------------------------------------------------------
//
// Title       : controlA
// Design      : lab2
// Author      : la lab
// Company     : kuet
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/1907022/lab2/src/controlA.v
// Generated   : Tue Nov 12 15:43:01 2024
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {controlA}}

module controlA ( a ,s2 ,s1 ,s0 ,b ,x );

input a;
wire a;
input s2;
wire s2;
input s1;
wire s1;
input s0;
wire s0;
input b;
wire b;
output x;
wire x;				  


assign x = (a) | (s2 & (~s1) & (~s0) & b) | (s2 & s1 & (~s0) & b) ;

//}} End of automatically maintained section

// Enter your statements here //

endmodule
