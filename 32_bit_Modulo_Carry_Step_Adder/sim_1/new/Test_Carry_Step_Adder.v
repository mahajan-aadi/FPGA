`timescale 1ns / 1ps

module Test_Carry_Step_Adder();

reg [31:0] a,b,check;
wire [31:0] sum;

carry_step_Modu_adder uut(a,b,sum);
initial repeat(10) begin
a=$random;
b=$random;
check=a+b;
#10$display($time, "a=%d, b=%d, moduleSum=%d, actualSum=%d", a,b, sum, check);


end
endmodule
