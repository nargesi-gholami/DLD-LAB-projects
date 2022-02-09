`timescale 1ps/1ps
module ABRCKT(input clk,ABAUD,UxRX, output UxRXIF);

wire [63:0]cnt;
wire [63:0]register;
wire clr,ld;

UART_controller UART_c(clk, ABAUD,UxRX,clr,UxRXIF, ld);

UART_datapath UART_d(clk,ld,clr,cnt,register);



endmodule
