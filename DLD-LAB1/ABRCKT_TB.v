`timescale 1ps/1ps
module ABRCKT_TB();

wire divide;
wire UxRXIF,up;
reg i8,i7,i6,i5,i4,i3,i2,i1;
reg down,load,preset,ABAUD,UxRX;

inverter #(5,3)inv(1'b1,up);

ABRCKT abrkct(up ,ABAUD,UxRX,  UxRXIF);

divide_counter divv(divide,i8,i7,i6,i5,i4,i3,i2,i1,up,down,load,preset);

initial begin 
i8 = 0;
i7 = 1;
i6 = 1;
i5 = 1;
i4 = 0;
i3 = 0; 
i2 = 0;
i1 = 1;
down = 0;
load = 0;
preset = 0;
UxRX = 0;
ABAUD = 1;
////////
UxRX = 1;
UxRX = 0;
UxRX = 1;
UxRX = 0;
UxRX = 1;
UxRX = 0;
UxRX = 1;
UxRX = 0;
/////////
ABAUD = 0;

end

endmodule