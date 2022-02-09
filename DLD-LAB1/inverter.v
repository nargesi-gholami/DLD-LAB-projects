`timescale 1ps/1ps
module inverter #(parameter  num_of_inverter = 5,delay = 2)(input vi, output vo);

integer i;

reg [num_of_inverter:0]temp;
assign temp[0] = vi;

initial begin
	while(1) begin
	    for(i = 0 ; i < num_of_inverter ; i = i+1) begin
		    #delay temp[i+1] = ~temp[i];
	    end
	    temp[0] = temp[num_of_inverter];
	end
end

assign vo = temp[num_of_inverter];

endmodule