`timescale 1ns/1ns
module integrateTB();

reg clk, rst, adjust, end_cal, start;
reg[3:0]n;
reg [15:0]InFreq;
reg [15:0] frac;
reg [1:0] ui;
wire valid, done;

integrate_system cpu(clk, rst, adjust, end_cal, start, n, InFreq, frac, ui, valid, done);

initial begin 
	clk = 1'b1;
	rst = 1'b0;
	ui = 2'b00;
	frac =  16'b0000001010001111;//0.01
	InFreq = 16'd2500;//200 kHz
	n = 4'b1001;
	#7 start = 1'b0;
end

always #3 clk = ~clk;//162 MHz 

initial begin
	adjust = 1'b0;
	#7 adjust = 1'b1;
	#100000 start = 1;
	#1000 start = 1'b0;
	#10000000 end_cal = 1'b1;
end


/*initial begin 
	clk = 1'b1;
	rst = 1'b0;
	ui = 2'b00;
	frac =  16'b0000001010001111;//0.01
	InFreq = 16'd2500;//200 kHz
	n = 4'b0111;
	#255 start = 1'b0;
end

always #125 clk = ~clk;//25 MHz 

initial begin
	adjust = 1'b0;
	#255 adjust = 1'b1;
	#100000
	#255 start = 1;
	#100 start = 1'b0;
	#1000000 end_cal = 1'b1;
end*/

endmodule
