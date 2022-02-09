`timescale 1ps/1ps
module frequency_divider(input clk, rst, cnt, ld, input[3:0] SW, output reg co, output reg [3:0] out);


always@(posedge clk, posedge rst, posedge ld)begin
	if(rst)
		out <= 8'b0;
	else if(ld)begin
			out <= SW;
			co <= 1'b0;
	end
	else if(cnt)
		{co, out} <= out + 1;
end


endmodule