

module alu ( A,B,S,Cin,Data,Cout );

input [5:0] A,B;
input [1:0] S;
input Cin;

output reg [5:0] Data;
output reg Cout;

wire [5:0] Y; 



controlB yb1 (B[0], S[0], S[1], Y[0]);
controlB yb2 (B[1], S[0], S[1], Y[1]);
controlB yb3 (B[2], S[0], S[1], Y[2]);
controlB yb4 (B[3], S[0], S[1], Y[3]);
controlB yb5 (B[4], S[0], S[1], Y[4]);
controlB yb6 (B[5], S[0], S[1], Y[5]);							  
												 


								 
parallel_adder pa1( A, Y, Cin, Data, Cout);






//}} End of automatically maintained section

// Enter your statements here //

endmodule
