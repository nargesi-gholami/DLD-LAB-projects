`timescale 1ns/1ns 
module fer_mul_dp(input clk, rst, init1, init2, up, down, input[3:0]n,input [15:0]InFreq,
							 output reg cnt_complete,output equal,output reg out);

reg [15:0]counter1;
reg [15:0]counter2;
wire clk_out;
inverter inv(clk_out, InFreq);
reg ex = 1'b0;
reg re = 1'b1;

always@(posedge clk, posedge rst)begin 
	if(rst)
		counter1 <= 16'b0;
	else if(init1)begin
		counter1 <= 16'b0;
		cnt_complete <= 1'b0;
		end
	else if(up) begin
		if(clk_out)
			counter1 <= counter1 + 1'b1;
		else begin
			cnt_complete <= 1'b1;
			if(re) counter1 <=  (counter1 << 1);
			re <= 1'b0;
			
		end
	end
end

always@(posedge clk, posedge rst) begin 
	if(rst)
		counter2 <= 16'b0;
	else if(init2)begin
		   counter2 <= 	(n == 4'b1001) ? (counter1 >> 9) :
			    	(n == 4'b1000) ? (counter1 >> 8) :
				(n == 4'b0111) ? (counter1 >> 7) :
				(n == 4'b0110) ? (counter1 >> 6) :
				(n == 4'b0101) ? (counter1 >> 5) :
				(n == 4'b0100) ? (counter1 >> 4) :
				(n == 4'b0011) ? (counter1 >> 3) :
				(n == 4'b0010) ? (counter1 >> 2) :
				(n == 4'b0001) ? (counter1 >> 1) : counter1;
	end
	else if(down)  
		counter2 <= counter2 - 1'b1;		
end

always@(posedge clk, posedge rst)begin
	if(rst)
		out <= 1'b0;
	else if(init2)begin
		out <= ex ? ~out : 1'b0;
		ex <= 1'b1;
	end
end

assign equal = (counter2 == 16'b0);




endmodule
