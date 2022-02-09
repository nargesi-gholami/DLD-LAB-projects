`timescale 1ns/1ns 
module shifter(input clk, rst, en_shift, en_shift2,input[15:0] vi, output reg[15:0] vo);


always@(posedge clk, posedge rst)begin
	if(rst)
		vo <= 8'b0;
	else if(en_shift2)
		vo <= vi;
	else if(en_shift)
		vo <= (vo << 1);
end


endmodule
