`timescale 1ps/1ps
module noise_eliminatorTB();

reg rst,preset;
reg [7:0] PSI_min,PSI_max,PIOset,FRO_min;
wire [7:0] setPeriod;
wire [7:0] adjusted;
wire fail;
wire clk,ring_up,up;

divide_counter1 div(fail,clk,rst,ring_up,FRO_min,PIOset,PSI_max,PSI_min,adjusted,up,preset,setPeriod);

inverter #(5,41000)inv1(1'b1,up);//24Hz signal
inverter #(5,15000)inv2(1'b1,clk);//100Hz signal
inverter #(5,1000000)inv3(1'b1,ring_up);//10Hz signal

reg power;

initial begin
rst = 1'b1;
#10
rst = 1'b0;
preset = 1'b0;
PSI_min = 8'b01011010;
PSI_max = 8'b10100000;
PIOset = 8'b01100100;
FRO_min = 8'b00000001;
#1000 
preset = 1'b1;
//////
rst = 1'b1;
#10
rst = 1'b0;
preset = 1'b0;
PSI_min = 8'b01011010;
PSI_max = 8'b10100000;
PIOset = 8'b01100100;
FRO_min = 8'b00000001;
#1000 
preset = 1'b1;

end

endmodule