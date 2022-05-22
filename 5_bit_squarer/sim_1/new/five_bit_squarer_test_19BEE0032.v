`timescale 1ns / 1ps
module five_bit_squarer_test_19BEE0032();

reg [4:0] a;
wire [9:0] P;
reg [9:0] check;
five_bit_squarer_19BEE0032 uut(a,P);

initial repeat(10) begin
a = $random;
check=a*a;
#10 $display ($time , "%d^2=%d(%d)",a,P,check);
end
endmodule

