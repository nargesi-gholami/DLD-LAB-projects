`timescale 1ps/1ps
module frequency_regulator(input clk, rst, PSI,input [7:0]setPeriod, output reg [7:0]adjustedDiv);

reg up,Down;
reg up2,init;
reg[7:0] cnt;
reg old_PSI;

reg dec_inc;
reg comp;


always @(PSI) begin 
	up2 = 1'b0;
	init = 1'b0;
	dec_inc = 1'b0;
	
	case (PSI)
		1'b1 :
		begin  // up counting PSI
			if(old_PSI)
				up2 = 1'b1;
		// init counter PSI
			else if (!old_PSI) 
				init = 1;
		end
		1'b0: // decrement or increment
			if(old_PSI)
				dec_inc = 1;
			
	endcase
	
end

always@(negedge PSI)
begin
	up   <= (cnt - setPeriod > 0) ? 1'b1 : 1'b0;
	Down <= (cnt - setPeriod < 0) ? 1'b1 : 1'b0;
	//done <= (cnt == setPeriod) ? 1'b1 : 1'b0;
end

always@(posedge clk, posedge rst)
	begin
		if(rst)
			cnt <= 8'b0;
		else begin
			if(init)
				cnt <= 8'b0;
			else if(up2)
				cnt <= cnt +1;
		end
	end

always@(posedge clk, posedge rst)
	begin
			if(rst)
				adjustedDiv <= 8'b0;
			else begin
				if(dec_inc)
				begin
					if(up)
						adjustedDiv <= adjustedDiv + 1;
					else if (Down)
						adjustedDiv <= adjustedDiv - 1;
				end
		end
	end
	
always@(posedge clk) begin
	old_PSI <= PSI;
end

endmodule
