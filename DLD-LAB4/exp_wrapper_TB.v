`timescale 1ns/1ns 
module exp_wrapper_TB();

reg clk, rst, start;
wire done;
reg [3:0] n;
reg [1:0] ui;
reg [15:0] fracpart;

exp_wrapper wx_wrapper(clk, rst, start, fracpart,  ui, n , done);

initial begin
	clk = 1'b0;
	rst = 1'b0;
	ui = 2'b00;
	//fracpart = 16'b0001100110011001;//1.1 - 
	//fracpart = 16'b00001100110011001;
	//fracpart = 16'b0001100110011001;
	//frac = 16'b000111110111000;//1.12
	fracpart =  16'b0000001010001111;//0.01
	start = 1'b0;
	n = 4'b0100;
	#55 start = 1'b1;
end

always #25 clk = ~clk;


endmodule
