`timescale 1ns/1ns 
module fer_mul_cntrl(input clk, rst, adjust, cnt_complete, equal, end_cal, output reg valid, init1, init2, up, down);

reg[2:0] ps,ns;
parameter idle = 3'b000 , init  = 3'b001, 
	  count = 3'b010, initt2 = 3'b011,
	  count_down = 3'b100, endd = 3'b101; 



always@(ps, adjust, equal, cnt_complete)begin
	ns <= idle;
	case(ps)
		(idle): ns <= adjust ? init : idle ;
		(init): ns <= count;
		(count): ns <= cnt_complete ? initt2 : count;	
		(initt2): ns <= count_down;
		(count_down): ns <= end_cal ? endd : count_down; 
		(endd): ns <= idle;
	endcase
end

always@(ps, equal, adjust, cnt_complete) begin
	{up, init1,init2,down, valid} <= 0;
	case(ps)
		(init):   init1 <= 1'b1; 
		(count):  up <= 1'b1; 
		(initt2): init2 <= 1'b1; 
		(count_down): 
		begin
			down <= 1'b1;
			init2 <= equal ? 1'b1 : 1'b0;
			valid <= equal ? 1'b1 : valid;
		end
	endcase
end

always@(posedge clk, posedge rst)begin
	if(rst)
		ps <= 3'b000;
	else
		ps <= ns;
end

endmodule