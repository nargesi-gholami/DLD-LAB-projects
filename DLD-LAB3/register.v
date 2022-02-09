`timescale 1ps/1ps
module register(input clk,input rst, input[7:0] in, output reg[7:0]  out);


always@(posedge clk, posedge rst)begin
if(rst)
	out <= 8'b0;
else
	out <= in;

end



endmodule