module counter(
	input clk,
	input high,
	input fin,
	output reg [5:0] fout
	);
	
wire [3:0]fq;


jk_flipflop jk1(high,high,clk,fin,fout[0]);
jk_flipflop jk2(fout[0],fout[0],clk,fin,fout[1]);


assign fq[0] = fout[1] & fout[0];
jk_flipflop jk3(fq[0],fq[0],clk,fin,fout[2]);

assign fq[1] = fq[0] & fout[2];
jk_flipflop jk4(fq[1],fq[1],clk,fin,fout[3]);

assign fq[2] = fq[1] & fout[3];
jk_flipflop jk5(fq[2],fq[2],clk,fin,fout[4]);

assign fq[3] = fq[2] & fout[4];
jk_flipflop jk6(fq[3],fq[3],clk,fin,fout[5]);


wire f59;
assign f59 = fout[5] && fout[4] && fout[3] && (~fout[2]) && fout[1] && fout[0]; 

always @ (posedge clk)
	begin
			
	end
	

endmodule