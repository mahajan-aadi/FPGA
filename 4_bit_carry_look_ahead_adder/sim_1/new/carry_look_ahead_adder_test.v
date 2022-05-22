`timescale 1ns / 1ps
module carry_look_ahead_adder_test;
reg [3:0] a,b;
reg cin;
wire [4:0] s;
reg [4:0] check;
carry_look_ahead_adder_19BEE0032 uut ( a,b,cin, s );
initial repeat(10) begin
a = $random;
b= $random;
cin=$random;
check=a+b+cin;
#10 $display ($time , "%d+%d+%d=%d(%d)",a,b,cin,s,check);
end
endmodule
