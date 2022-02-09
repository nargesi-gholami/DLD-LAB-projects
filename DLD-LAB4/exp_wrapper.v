`timescale 1ns/1ns 
module exp_wrapper(input clk, rst, start, input[15:0] frac, input[1:0] ui, input [3:0]n , output done);


wire  en_shift, en_shift2, exp_start, f_read, f_write, ui_shift;
wire done_exp;

exp_wrapper_dp dp(clk, rst, ui, frac,ui_shift, done, en_shift, en_shift2, exp_start, f_read, f_write, done_exp);

exp_wrapper_cntrl cntrl(clk, rst, start, done_exp, n, done, en_shift,en_shift2, exp_start , f_read, f_write,ui_shift);

endmodule
