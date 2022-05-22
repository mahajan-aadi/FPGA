`timescale 1ns / 1ps
module Bough_Wooley_test_19BEE0032();

reg signed [3:0] a,b;
wire signed [7:0] P;
reg signed [7:0] check;
Bough_Wooley_array_multiplier_19BEE0032 uut(a,b,P);

initial repeat(10) begin
a = $random;
b= $random;
check=a*b;
#10 $display ($time , "%d*%d=%d(%d)",a,b,P,check);
end
endmodule

