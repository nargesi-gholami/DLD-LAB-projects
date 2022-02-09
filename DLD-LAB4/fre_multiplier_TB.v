`timescale 1ps/1ps 
module fer_mul_TB();

wire out, valid;
reg[15:0] InFreq = 16'd2500; //200KHz--big frequence = 200MHz
reg[3:0] n;
reg adjust, rst, clk, end_cal;
initial begin
	clk = 1'b1;
end

fer_mul_toplevel fre_mulTB(clk, rst, adjust,end_cal, n, InFreq, valid, out);

always #2500 clk = ~clk;//200MHz

initial begin
	end_cal = 1'b0;
	rst = 1'b0;
	n = 4'b0001;
	adjust = 1'b0;
	#5200 adjust = 1'b1;

	////////////
	/*n = 4'b0010;
	adjust = 1'b0;
	adjust = 1'b1;

	///////////
	n = 4'b0011;
	adjust = 1'b0;
	adjust = 1'b1;*/

end
endmodule