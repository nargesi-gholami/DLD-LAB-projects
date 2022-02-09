`timescale 1ps/1ps
module divide_counterTB();
wire up;
reg i8,i7,i6,i5,i4,i3,i2,i1;
reg down,preset;
wire Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q1;
wire out3;

divide_counter1 divv(Q1,i4,i3,i2,i1,up,down,i8,i7,i6,i5,preset,Q2,Q3,Q4,Q5,Q6,Q7,Q8,out3);

inverter #(5,2000)inv(1'b1,up);

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
preset = 0; 
#5000;
preset = 1;

end

endmodule
