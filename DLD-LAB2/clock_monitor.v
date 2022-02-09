`timescale 1ps/1ps
module clock_monitor (input clk,rst,input ring_up, input [7:0]PSImin,PSImax,PIOset,FRO_min,
	 output[7:0] setPeriod ,output fail,output reg [7:0] cnt );

reg [7:0] count;
//reg [7:0] cnt;
reg up;
reg init;

always@(ring_up)begin
up = 1'b0;
init = 1'b0;
	if(ring_up == 1'b1)
		up = 1'b1;
	else
		init = 1'b1;
end


always@(posedge clk, posedge rst)begin
	if(rst)
		cnt <= 8'b0;
	else
		begin
			if(up)
				cnt <= cnt + 8'b00000001;
			else if(init)
				cnt <= 8'b0;
		end
	
end

assign setPeriod = (PSImin > PIOset) ? PSImin : (PSImax < PIOset) ? PSImax : PIOset; 

assign fail = ( FRO_min*3 -  cnt > 8'b00000000) ? 1'b0 : 1'b1;

endmodule
