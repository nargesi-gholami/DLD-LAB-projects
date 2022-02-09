`timescale 1ns/1ns 
module fer_mul_toplevel(input clk, rst, adjust, end_cal,input [3:0]n, input[15:0]InFreq, output valid, output out);

wire init1,init2,up,down,cnt_complete, equal, out_clk;

fer_mul_dp fre_dp(clk, rst, init1, init2, up, down, n, InFreq, cnt_complete,equal, out_clk);

fer_mul_cntrl fre_cntrl(clk, rst, adjust, cnt_complete, equal, end_cal, valid, init1, init2, up, down);

assign out = out_clk;

endmodule