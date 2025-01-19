`timescale 1ps / 1ps


module breadboard();

reg str_clk, clk;					   
wire [5:0] databus;

reg fin;
reg [5:0] fout;
counter	c1(clk,1,fin,fout);


reg [5:0] sec1, sec2, min1, min2, year;
reg [4:0] hour1, hour2, date;
reg [3:0] month;
reg [2:0] day;
reg load,clear,enable, mload, menable;

second1 s1(clk, load, clear, enable, databus, sec1, databus);
second2 s2(clk, load, clear, enable, databus, sec2, databus);
minute m1(clk, load, clear, enable, databus, min1, databus);	
minute2 m2(clk, load, clear, enable, databus, min2, databus);
hour1 h1(clk, load, clear, enable, databus, hour1, databus);
hour2 h2(clk, load, clear, enable, databus, hour2, databus);
month mn1(clk, load, clear,enable, databus, month, databus);
date d1(clk, load, clear, enable, databus, date, databus);
day dy1(clk, load, clear, enable, databus, day, databus);
year y1(clk, load, clear, enable, databus, year, databus);



reg [3:0] gin;
reg [3:0] gout[2:0];
reg [3:0] T[2:0];
reg Kc[2:0], La[2:0], Lb[2:0], Ea[2:0], Lr[2:0], Er[2:0];
reg [1:0] s[2:0]; 
reg Cc, M, t, k7, u, Ts, c7, Az;  


//Timer set module

//pla_timerSet pla1 (gin,t,k7,clk, gout[0],T[0],s[0],Kc[0],La[0],Lb[0],Ea[0],Lr[0],Er[0]);

//Time update module
	
//pla_timeUpdate pla2 (gin,u,clk, gout[1],T[1],s[1],Kc[1],La[1],Lb[1],Ea[1],Lr[1],Er[1]);
	
//Timer compare module
	
//pla_timerCompare pla3 (gin,Ts,c7,Az,clk, gout[2],T[2],s[2],Kc[2],La[2],Lb[2],Ea[2],Lr[2],Er[2],Cc,M);


always @(*)
	begin															  
		gin <= gout[2];
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
		gin = 4'b0001;
		str_clk = 1;
		
		load = 0;
			   
		#120;
		str_clk = 0;
		
	end

endmodule




/*

----databus second minute----
			#1;
		menable = 1;
		load = 1;
		
		enable = 0;
		mload = 0;
		
		#2;
		enable = 1;
		mload = 1;
		
		menable = 0;
		load = 0;


------pla--------

		#1;
		t = 1;
		k7 =1;
		
		u=1;
		
		Ts=1;
		Az = 1;
		c7 =1;
		
		#20;
		k7 = 0;
		u=0;
		
		Az=0;
		c7=0;
		
		#40;
		u=1;
		
		Az=1;
		c7=0;
		
  
		
		
	---Alu----
		
		#1;
		A <= 6'h9;
		B <= 6'h6;
		S <= 01;
		Cin <= 0;
		
		#1;
		A <= 6'hF;
		B <= 6'h9;
		S <= 10;
		Cin <= 1;
		
		

*/