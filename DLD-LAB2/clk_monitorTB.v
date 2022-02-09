`timescale 1ps/1ps
module clk_montitorTB();

reg rst,preset;
reg [7:0] PSImin,PSImax,PIOset,FRO_min;
wire [7:0] setPeriod;
wire [7:0] cnt;
wire fail;
wire clk,up_ring,up;

inverter #(5,41000)inv1(1'b1,up);//24Hz signal
inverter #(5,15000)inv2(1'b1,clk);//100Hz signal
inverter #(5,1000000)inv3(1'b1,up_ring);//10Hz signal

//divide_counter1 div(fail,clk,rst,up_ring,FRO_min,PIOset,PSI_max,PSI_min,adjusted,up,preset,setPeriod);
clock_monitor k( clk,rst, up_ring,PSImin,PSImax,PIOset,FRO_min, setPeriod , fail,cnt);


initial begin 
rst = 1'b1;
#10
rst = 1'b0;
preset = 1'b0;
PSImin = 8'b01011010;
PSImax = 8'b10100000;
PIOset = 8'b01100100;
FRO_min = 8'b00000011;
#1000 
preset = 1'b1;

end


endmodule
