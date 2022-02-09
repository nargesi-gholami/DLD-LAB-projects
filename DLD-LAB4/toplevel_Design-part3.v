`timescale 1ns/1ns
module integrate_system(input clk, rst, adjust, end_cal, start, input[3:0]n, input[15:0]InFreq, input[15:0] frac, input[1:0] ui,
											 output valid, done);



fer_mul_toplevel fre(clk, rst, adjust, end_cal, n, InFreq,  valid,  out);

exp_wrapper ex(out, rst, start, frac,ui, n, done);


endmodule