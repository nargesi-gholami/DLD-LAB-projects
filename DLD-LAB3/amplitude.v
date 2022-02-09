`timescale 1ps/1ps
module amplitude(input[7:0] signal_in,input[1:0]am, output[7:0] signal_out);

assign signal_out =  (am == 2'b00) ? (signal_in >>> 1) :
			(am == 2'b01) ? (signal_in >>> 2) :
			(am == 2'b10) ? (signal_in >>> 3) :
			(am == 2'b11) ? (signal_in >>> 4) : signal_in;
endmodule