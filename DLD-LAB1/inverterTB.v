`timescale 1ps/1ps
module inverterTB();

reg vi;
wire vo;

inverter #(5,5)inverter_tb(vi,vo);

initial begin
	vi = 0;
	#30;

	vi = 1;
	#40;
end

endmodule
