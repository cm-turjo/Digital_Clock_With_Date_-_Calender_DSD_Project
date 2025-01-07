

module alu ( a1 ,a2 ,a3 ,a4 ,b1 ,b2 ,b3 ,b4 ,s1 ,s0 ,cin ,f1 ,f2 ,f3 ,f4 ,cout );

input a1;
wire a1;
input a2;
wire a2;
input a3;
wire a3;
input a4;
wire a4;
input b1;
wire b1;
input b2;
wire b2;
input b3;
wire b3;
input b4;
wire b4; 
input s1;
wire s1;
input s0;
wire s0;
input cin;
wire cin;
output f1;
wire f1;
output f2;
wire f2;
output f3;
wire f3;
output f4;
wire f4;
output cout;
wire cout;




wire wb1, wb2, wb3, wb4; 

controlB cb1(b1 ,s0 ,s1 ,wb1);
controlB cb2(b2 ,s0 ,s1 ,wb2);
controlB cb3(b3 ,s0 ,s1 ,wb3);
controlB cb4(b4 ,s0 ,s1 ,wb4);
												 



parallel_adder pa1( a1 ,a2 ,a3 ,a4 ,wb1 ,wb2 ,wb3 ,wb4 ,cin ,f1 ,f2 ,f3 ,f4 ,cout);	 






//}} End of automatically maintained section

// Enter your statements here //

endmodule
