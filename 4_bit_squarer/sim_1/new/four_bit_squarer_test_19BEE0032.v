`timescale 1ns / 1ps
module four_bit_squarer_test_19BEE0032();

reg [3:0] a;
wire [7:0] P;
reg [7:0] check;
four_bit_squarer_19BEE0032 uut(a,P);

initial repeat(10) begin
a = $random;
check=a*a;
#10 $display ($time , "%d^2=%d(%d)",a,P,check);
end
endmodule

