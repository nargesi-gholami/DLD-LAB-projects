`timescale 1ps/1ps
module waveGenTB2();

wire clk;
reg [7:0]phase_cnrl;
wire [7:0] signal;
reg [7:0] add;

Romm mm(signal,clk,add);

initial begin
add <= 8'b0;
end

always@(posedge clk)begin
	add <= add + phase_cnrl;
end

inverter #(5,10)inv(1'b1,clk);

initial begin
phase_cnrl = 8'b00000001;
#10000 $stop;

end
endmodule
