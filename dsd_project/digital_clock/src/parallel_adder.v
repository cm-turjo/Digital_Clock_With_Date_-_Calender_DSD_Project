module parallel_adder (A, Y, Cin, Data, Cout);

input [5:0] A,Y;
input Cin;

output reg [5:0] Data;
output reg Cout;

wire [4:0] W;



full_adder fa1 (A[0], Y[0], Cin, Data[0], W[0]);
full_adder fa2 (A[1], Y[1], W[0], Data[1], W[1]);
full_adder fa3 (A[2], Y[2], W[1], Data[2], W[2]);
full_adder fa4 (A[3], Y[3], W[2], Data[3], W[3]);
full_adder fa5 (A[4], Y[4], W[3], Data[4], W[4]);
full_adder fa6 (A[5], Y[5], W[4], Data[5], Cout);
									  
//}} End of automatically maintained section

// Enter your statements here //

endmodule
