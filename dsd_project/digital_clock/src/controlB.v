

module controlB ( b ,s0 ,s1 ,y );

input b;
wire b;
input s0;
wire s0;
input s1;
wire s1;
output y;
wire y;	  

assign y = (b & s0) | (s1 & (~b)) ;

//}} End of automatically maintained section

// Enter your statements here //

endmodule
