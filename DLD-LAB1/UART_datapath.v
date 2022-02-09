`timescale 1ps/1ps
module UART_datapath(input clk,ld,clr,output reg[63:0]cnt,output reg[63:0] register);

always@(posedge clk) begin

	if(clr)begin
		cnt <= 64'b0;
	end
		
	if(ld) begin
		cnt <= cnt + 1;

	end
end

always @(posedge clk) begin
 if(clr)begin
		register <= 64'b0;
	end
 if (ld)
 begin
 	register <= cnt;
 end
end
//---------------

endmodule

