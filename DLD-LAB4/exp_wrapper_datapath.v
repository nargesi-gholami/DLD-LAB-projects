`timescale 1ns/1ns 
module exp_wrapper_dp(input clk, rst,input[1:0]ui,input [15:0]frac,input ui_shift,
				done, en_shift, en_shift2, exp_start, f_read, f_write, output done_exp);

wire [1:0] intpart;
wire [15:0] fracpart;
wire [15:0] frac_shift;
wire [21:0] exp_out;
shifter sh(clk, rst, en_shift, en_shift2, frac, frac_shift);

exponential exp(clk, rst, exp_start, frac_shift, done_exp, intpart , fracpart);

wire[21:0] exp_in;
assign exp_in  = {3'b0,intpart , fracpart};

comb_shift c_shift(exp_in, ui_shift, ui, exp_out);

FIFO ff(clk, rst, f_read, f_write, exp_out);

endmodule