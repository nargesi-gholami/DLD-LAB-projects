`timescale 1ps/1ps
module comb_shift(input[21:0] exp_in, input ui_shift, input[1:0]ui, output[21:0] exp_out);

assign exp_out =  (!ui_shift) ?   {exp_out} : 
		  (ui == 2'b01) ? (exp_in << 1) :
		  (ui == 2'b10) ? (exp_in << 2) :
		  (ui == 2'b11) ? (exp_in << 3) : {exp_in};
endmodule
