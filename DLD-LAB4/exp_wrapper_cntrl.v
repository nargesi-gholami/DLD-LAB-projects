`timescale 1ns/1ns 
module exp_wrapper_cntrl(input clk, rst, start_cal, done_exp,input[3:0] n, output reg done, en_shift, en_shift2, exp_start ,f_read, f_write,ui_shift);

reg[2:0]ps, ns; 
parameter start = 3'b000, shift = 3'b001, start_ca = 3'b010, cal = 3'b011, cal2 = 3'b100, endd = 3'b101;

reg [2:0]counter;
reg co;
initial begin
	counter <= 3'b011;
	co <= 1'b0;
end

always@(ps, start_cal, done_exp, co)begin
	ns <= start;
	case(ps)
	(start): ns <= start_cal ? shift : start;
	(shift):  ns <= start_ca; 
	(start_ca): ns <= cal;
	(cal):   ns <= (done_exp) ? cal2 : cal;
	(cal2):  ns <= co ? endd : shift;
	(endd):  ns <= start; 
	endcase
end

always@(ps, start_cal, done_exp, co)begin
	{ui_shift, exp_start, en_shift, en_shift2, done, f_write, f_read} <= 0;
	case(ps)
	(shift) :  begin en_shift2 <= (counter == 3'b011) ? 1'b1 : 1'b0; en_shift <= (counter != 3'b011) ? 1'b1 : 1'b0;end
	(start_ca):  begin exp_start <= 1'b1; end
	(cal) :   exp_start <= 1'b0; 
	(cal2):   begin  ui_shift <= 1'b1; f_write <= (counter != 3'b100) ? 1'b1 : 1'b0; end
	(endd):   done <= 1'b1;
	endcase

end

always@(posedge clk, posedge rst)begin 
	if(rst)
		ps <= start;
	else 
		ps <= ns;
end  

always@(posedge clk, posedge rst) begin 
	if(rst)
		counter <= 3'b0;
	else if(ps == cal)	
		{co, counter} <= counter + 1'b1;
end

endmodule