`timescale 1ps/1ps
module ampliTB();

wire clk;
inverter #(5,2)inv(1'b1,clk);

reg rst;
reg cnt, ld;
wire co1, co2;
wire [3:0]out1, out2;
reg [12:0] SW;
wire [7:0] signal;
wire [7:0] signal_out;

reg clk_in;

initial begin
	clk_in = 1'b0;
end

frequency_divider fre1( clk, rst, cnt, ld || co2 , SW[3:0], co1,out1);
frequency_divider fre2( co1, rst, cnt, ld || co2 , SW[7:4], co2,out2);

waveform_generator WG(clk_in, rst, SW[10:8], signal);
amplitude ampli(signal,SW[12:11], signal_out);

always@(co2)begin 
clk_in = co2 ? ~clk_in : clk_in;
end

initial begin
SW =13'b0000000000011;
rst = 1'b0;
cnt = 1'b1;
#100 ld = 1'b1;
#500 ld = 1'b0;
///////////////
SW =13'b0000000000011;
#5000000;
SW =13'b0100000000011;
#5000000;
/////////////////
SW =13'b1000100000011;
#5000000;
SW =13'b0100100000011;
#5000000;
///////////////////
SW =13'b1001000000011;
#5000000;
SW =13'b1101000000011;
#5000000;
/////////////////
SW =13'b0101100000011;
#5000000; 
SW =13'b1001100000011;
#5000000;
////////////////
SW =13'b0101000000011;
#5000000; 
SW =13'b0001000000011;
#5000000;
///////////////////
SW =13'b0110100000011;
#5000000; 
SW =13'b1010100000011;
#5000000;
///////////////////
SW =13'b0111000000011;
#5000000; 
SW =13'b11111000000011;
#5000000;
/////////////////////

#100000 $stop;

end


endmodule

