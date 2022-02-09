`timescale 1ps/1ps
module noise_eliminator(input clk,rst,pulse, output reg true_pulse);

parameter[1:0] Waitfor1 = 2'b00, Noisechk1 = 2'b01, Stable1 = 2'b10, Noisechk0 = 2'b11;
reg[1:0] ps,ns;

always@ (pulse) begin // State Transittions
	case (ps)
		Waitfor1:  ns = pulse ? Noisechk1 : Waitfor1;
		Noisechk1: ns = pulse ? Stable1 : Waitfor1;  
		Stable1:   ns = pulse ? Stable1 : Noisechk0;
		Noisechk0: ns = pulse ? Stable1 : Waitfor1 ;  
	endcase
end

always@ (ps) begin
	case (ps)
		Waitfor1: true_pulse = 1'b0;
		Noisechk1: true_pulse = 1'b0; 
		Stable1: true_pulse = 1'b1;
		Noisechk0: true_pulse = 1'b1;
	endcase
end

always@ (posedge clk, posedge rst) begin 
	if(rst)
		ps <= Waitfor1;
	else
		ps <= ns;	
end


endmodule