`timescale 1ps/1ps
module ABRCKT(input clk,ABAUD,UxRX, output reg UxRXIF);

wire [63:0]cnt = 64'b0;
wire [63:0]register = 64'b0;
wire clr,ld;

UART_controller UART_c(clk, ABAUD,UxRX,clr,UxRXIF, ld);

UART_datapath UART_d(clk,ld,clr,cnt);



endmodule





