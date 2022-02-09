`timescale 1ps/1ps
module adder(input[7:0] phase_cntr,in, output[7:0]  out);

assign out = phase_cntr + in;

endmodule