

module controlC ( cin ,s2 ,c );

input cin;
wire cin;
input s2;
wire s2;
output c;
wire c;			

assign c = (~s2) & cin ; 

//}} End of automatically maintained section

// Enter your statements here //

endmodule
