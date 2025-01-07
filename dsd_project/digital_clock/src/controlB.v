

module controlB ( b ,s0 ,s1 ,y );

input b,s0,s1;
output y;

assign y = (b & s0) | (s1 & (~b)) ;

//}} End of automatically maintained section

// Enter your statements here //

endmodule
