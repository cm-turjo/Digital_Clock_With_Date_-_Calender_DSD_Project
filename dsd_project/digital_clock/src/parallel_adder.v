module parallel_adder (a1 ,a2 ,a3 ,a4 ,b1 ,b2 ,b3 ,b4 ,cin ,f1 ,f2 ,f3 ,f4 ,cout);

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



wire w1,w2,w3,c1,c2,c3;

full_adder fa1(a1 ,b1 ,cin ,f1 ,w1); 

full_adder fa2(a2 ,b2 ,c1 ,f2 ,w2);

full_adder fa3(a3 ,b3 ,c2 ,f3 ,w3);

full_adder fa4(a4 ,b4 ,c3 ,f4 ,cout);
//}} End of automatically maintained section

// Enter your statements here //

endmodule
