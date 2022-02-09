`timescale 1ns/1ns 
module FIFO(input clk, rst, f_read, f_write,  input[21:0] exp_in);

reg [21:0]fifo[8:0];//initial location was [21:0]fifo[3:0]
reg [3:0] pointer;
integer i;

initial begin 
	for(i = 0 ; i < 9 ; i = i + 1)begin
		fifo[i] <= 21'b0;
	end
	pointer <= 4'b0000;
end


always@(posedge clk, posedge rst)begin
	if(rst)
	begin
		pointer <= 1'b0;
		for(i = 0 ; i < 9 ; i = i + 1)begin
			fifo[i] <= 21'b0;
		end
	end
	//else if(f_read)begin
	//	exp_out <= fifo[pointer];
	///	pointer <= pointer - 1'b1;
	//end
	else if(f_write)begin
		fifo[pointer] <= exp_in;
		pointer <= pointer + 1'b1;
	end
end

endmodule



