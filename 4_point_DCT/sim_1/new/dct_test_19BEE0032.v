`timescale 1ns / 1ps
module dct_test_19BEE0032();

reg signed [3:0] x0,x1,x2,x3;
wire signed [6:0] y0,y1,y2,y3;
dct_19BEE0032 uut( x0,x1,x2,x3,y0,y1,y2,y3);
initial begin 
x0=2;
x1=3;
x2=4;
x3=5;
#10;
end
endmodule
