`timescale 1ps/1ps
module waveGenTB();
wire clk;

inverter #(5,2)inv(1'b1,clk);

reg rst;
reg [2:0] func;
wire [7:0] signal;

waveform_generator WG(clk, rst, func, signal);

initial begin
rst = 1'b0;

#10000;
func = 3'b000;

#10000;
func = 3'b001;

#10000
func = 3'b010;

#10000; 
func = 3'b011;

#10000;
func= 3'b100;

#10000;
func = 3'b101;

#10000;
func= 3'b110;

#10000;
func = 3'b000;

#10000 $stop;

end


endmodule