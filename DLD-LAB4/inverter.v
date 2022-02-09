`timescale 1ns/1ns
module inverter (output vo, input[15:0] delay);

reg temp = 1'b0;

always #(delay) temp = ~temp;


assign vo = temp;

endmodule