`timescale 1ps / 1ps


module breadboard();

reg str_clk, clk;					   


reg [3:0] gin;
reg [3:0] gout;
reg [3:0] T;
reg Kc, La, Lb, Ea, Lr, Er;
reg [1:0] s; 
reg Cc, M, t, k7, u, Ts, c7, Az;  

//reg LA, LB, EA, LR, ER;


//Timer set module

pla_timerSet pla1 (gin,t,k7,clk, gout,T,s,Kc,La,Lb,Ea,Lr,Er);

//Time update module
	
//pla_timeUpdate pla2 (gin,u,clk, gout[1],T[1],s[1],Kc[1],La[1],Lb[1],Ea[1],Lr[1],Er[1]);
	
//Timer compare module
	
//pla_timerCompare pla3 (gin,Ts,c7,Az,clk, gout[2],T[2],s[2],Kc[2],La[2],Lb[2],Ea[2],Lr[2],Er[2],Cc,M);


always @(*)
	begin															  
		gin <= gout;
	end




//reg [5:0] A,B,Data;
//reg [1:0] S;
//reg Cin,Cout;

//wire [5:0] databus;

//alu a1(A,B,S,Cin,Data,Cout);
																 




always @(posedge str_clk)
	begin 
		while(str_clk)
			begin
				clk = 0;
				#1;
				clk = 1;
				#1;
			end
	end

initial
	begin
		str_clk = 0;
		
		#1;
		gin = 001;
		str_clk = 1;
		t=0;
		
		#1;
		t = 1;
		k7 =1;
		
		#20;
		k7 = 0;
		
		#100;
		str_clk = 0;
		
	end

endmodule




/*
reg a1,a2,a3,a4,b1,b2,b3,b4,s2,s1,s0,cin;
wire f1,f2,f3,f4,cout;

alu al1(a1 ,a2 ,a3 ,a4 ,b1 ,b2 ,b3 ,b4 ,s2 ,s1 ,s0 ,cin ,f1 ,f2 ,f3 ,f4 ,cout);
*/