`timescale 1ns / 1ps
module wallace_tree_19BEE0032_test();

reg [3:0] a,b;
wire [7:0] P;
reg [7:0] check;
wallace_tree_19BEE0032 uut(a,b,P);

initial repeat(10) begin
a = $random;
b= $random;
check=a*b;
#10 $display ($time , "%d*%d=%d(%d)",a,b,P,check);
end
endmodule

