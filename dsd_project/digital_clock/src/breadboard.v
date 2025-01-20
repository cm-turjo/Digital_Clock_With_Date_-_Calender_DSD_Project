`timescale 1ps / 1ps


module breadboard();

reg str_clk, clk;					   


reg [5:0] sec1, sec2, min1, min2, year;
reg [4:0] hour1, hour2, date;
reg [3:0] month;
reg [2:0] day;
reg load,clear,enable,secCount,minCount,hourCount,dayCount,dateCount,monthCount,yearCount;
																				
wire [5:0] databus;

second1 s1(clk, load, clear, enable, databus, sec1, databus, secCount);
second2 s2(clk, load, clear, enable, databus, sec2, databus);
minute m1(clk, load, clear, enable, databus, secCount, min1, databus, minCount);	
minute2 m2(clk, load, clear, enable, databus, min2, databus);
hour1 h1(clk, load, clear, enable, databus, minCount, hour1, databus, hourCount);
hour2 h2(clk, load, clear, enable, databus, hour2, databus);

day dy1(clk, load, clear, enable, databus, hourCount, day, databus, dayCount);
date d1(clk, load, clear, enable, databus, dayCount, date, databus, dateCount);
month mn1(clk, load, clear,enable, databus, dateCount, month, databus, monthCount);
year y1(clk, load, clear, enable, databus, monthCount, year, databus, yearCount);






reg [3:0] gin[2:0];
reg [3:0] gout[2:0];
reg [3:0] T[2:0];
reg Kc[2:0], La[2:0], Lb[2:0], Ea[2:0], Lr[2:0], Er[2:0];
reg [1:0] s[2:0]; 
reg Cc, M, t, k7, u, Ts, c7, Az, Cin;  


//Timer set module

//pla_timerSet pla1 (gin[0],t,k7,clk,gout[0],T[0],s[0],Kc[0],La[0],Lb[0],Ea[0],Lr[0],Er[0]);
	

//Time update module
	
//pla_timeUpdate pla2 (gin[1],u,clk,gout[1],T[1],s[1],Kc[1],La[1],Lb[1],Ea[1],Lr[1],Er[1]);


//Timer compare module
	
//pla_timerCompare pla3 (gin[2],Ts,c7,Az,clk,gout[2],T[2],s[2],Kc[2],La[2],Lb[2],Ea[2],Lr[2],Er[2],Cc,M,Cin);



//pla enable status
reg [2:0]pla;

//pla_status p1(t, Ts, u, clk, pla);

//Alu control signal
//alu_control_signal acs1(pla, s, clk, S);


reg [5:0] A,B,Data;
reg [1:0] S;
reg Cout;

//alu a1(A,B,S,Cin,Data,Cout);

//zero_sign z1(A, Az);


always @(*)
	begin															  
		gin[0] = ( gout[0] & {4{pla[0]}} ) | ( {4'b0001} & {4{~pla[0]}} );
		gin[1] = ( gout[1] & {4{pla[1]}} ) | ( {4'b0001} & {4{~pla[1]}} );
		gin[2] = ( gout[2] & {4{pla[2]}} ) | ( {4'b0001} & {4{~pla[2]}} );
	end

	
	

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
		load = 0;	  
		
		str_clk = 1;   
		
						
		
		#1000;
		str_clk = 0;
		
	end

endmodule




/*
		
---------Alu-----------
		
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
		
--------PLA-------------
		#1;
		gin[0] = 4'b0001;
		gin[1] = 4'b0001;
		gin[2] = 4'b0001;
		
		t = 1; k7 = 0;
		u = 0; 
		Ts = 0; c7= 0; Az = 0;
		
		
		str_clk = 1;   
		
		
		#12;
		t = 0; k7 = 0;
		u = 1;
		Ts = 0; c7 = 0; Az = 0;
		
		#12;
		t = 0; k7 = 0;
		u = 0;
		Ts = 1; c7 = 0; Az = 1;  
		
		
		#120;
		str_clk = 0;
		

*/
