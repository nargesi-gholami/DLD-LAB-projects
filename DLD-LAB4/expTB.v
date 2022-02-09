`timescale 1ns/1ns 
module exp_TB();

reg clk,rst,start;
reg [15:0] x;
wire done;
wire [1 :0] intpart;
wire [15:0] fracpart;

exponential ex(clk, rst, start, x, done, intpart, fracpart);

initial begin
	clk = 1'b1;
	rst = 1'b0;
end

always #25 clk = ~clk;

initial begin
	start = 1'b0;
	#42 start = 1'b1;
	#41 start = 1'b0;
	//x = 16'b1000000000000000;//0.5
	//#2000
	//x = 16'b0100000000000000;//0.25
	//#2000
	//x = 16'b0110000000000000;//0.375
	//#2000
	x = 16'b0000001010001111;//0.01
	#2000
	$stop;

end

endmodule