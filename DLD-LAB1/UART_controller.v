`timescale 1ps/1ps
module UART_controller(input clk, ABAUD,UxRX, output reg clr,UxRXIF, ld);

reg [3:0] ps,ns;
reg [4:0]U;
parameter[3:0] 
idle = 4'b0000,init = 4'b0001,start_ = 4'b0010 ,U1= 4'b0011 ,
U2= 4'b0100 ,U3= 4'b0101 ,U4= 4'b0110 ,U5= 4'b0111 ,
U6= 4'b1000 ,U7= 4'b1001 ,U8= 4'b1010 ,endd= 4'b1011;

always@(ps,ABAUD,UxRX) 
begin
	ns = 0;
	case(ps)
	   idle: ns = ABAUD ? init : idle;
	   init: begin ns = UxRX ? init : start_; clr = UxRX ? 1'b1 : 1'b0; end
	   start_: begin ns = UxRX ? U1 : start_;
	                 ld = UxRX ? 1'b1 : 1'b0;
			 clr = 1'b0; 
		   end
	   U1: ns = UxRX ? U1 : U2;
	   U2: ns = UxRX ? U3 : U2;
	   U3: ns = UxRX ? U3 : U4;
	   U4: ns = UxRX ? U5 : U4; 
	   U5: ns = UxRX ? U5 : U6; 
	   U6: ns = UxRX ? U7 : U6;
	   U7: begin ns = UxRX ? U7 : U8 ; ld = UxRX ? 1'b0 : 1'b1; end 
	   U8: ns = UxRX ? endd : U8; 
	   endd: begin ns = ABAUD ? endd : idle;UxRXIF = ABAUD ? 1'b0 : 1'b1; end
	   default ns = idle;
	endcase
end
//---------------

always@(posedge clk) begin
	ps <= ns;
end


endmodule

