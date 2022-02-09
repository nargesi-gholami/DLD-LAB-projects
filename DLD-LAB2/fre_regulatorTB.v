`timescale 1ps/1ps
module fre_reg_TB();


wire clk;
reg rst;
reg preset;
reg [7:0]setPeriod;
wire [7:0]adjusted;
wire out,done;

inverter #(5,52000)inv1(1'b1,up);//20Hz signal
inverter #(5,20000)inv2(1'b1,clk);//50Hz signal

divide_counter1 div(out,adjusted,clk,rst,setPeriod,up,preset,done);

initial begin
rst = 1'b0;
preset = 1'b0;
setPeriod = 8'b01111101;
#1000000 preset = 1'b1;

////////

 
end

endmodule
