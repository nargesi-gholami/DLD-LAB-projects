`timescale 1ps/1ps
module freeTB();

wire clk;
inverter #(5,2)inv(1'b1,clk);

reg rst;
reg cnt, ld;
reg [7:0]in;
wire co1, co2;
wire [3:0]out1, out2;
reg [2:0] func;
wire [7:0] signal;

reg clk_in;

initial begin
	clk_in = 1'b0;
end

frequency_divider fre1( clk, rst, cnt, ld || co2 , in[3:0], co1,out1);
frequency_divider fre2( co1, rst, cnt, ld || co2 , in[7:4], co2,out2);

waveform_generator WG(clk_in, rst, func, signal);

always@(co2)begin 
clk_in = co2 ? ~clk_in : clk_in;
end


initial begin
in = 8'b00000011;
rst = 1'b0;
cnt = 1'b1;
#100 ld = 1'b1;
#500 ld = 1'b0;
///////////////
func = 3'b000;
in =8'b00000011;
#5000000;
in = 8'b01111111;
 ld = 1'b1;#100 ld = 1'b0;
#5000000;
/////////////////
/*in = 8'b00000011;
func = 3'b001;
#5000000;
in = 8'b01111111; 
ld = 1'b1;#100 ld = 1'b0;
#5000000;
///////////////////
in = 8'b00000011;
func = 3'b010;
#5000000;
in = 8'b01111111;
 ld = 1'b1;#100 ld = 1'b0;
#5000000;
/////////////////
in = 8'b00000011;
func = 3'b011;
#5000000; 
in = 8'b01111111;
ld = 1'b1;#100 ld = 1'b0;
#5000000;
////////////////
in = 8'b00000011;
func = 3'b100;
#5000000; 
in = 8'b01111111;
ld = 1'b1;#100 ld = 1'b0;
#5000000;
///////////////////

in = 8'b00000011;
func = 3'b101;
#5000000; 
in = 8'b01111111;
ld = 1'b1;#100 ld = 1'b0;
#5000000;
///////////////////

in = 8'b00000011;
func = 3'b110;
#5000000; 
in = 8'b01111111;
ld = 1'b1;#100 ld = 1'b0;
#5000000;
/////////////////////*/

#100000 $stop;

end


endmodule



