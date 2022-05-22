`timescale 1ns / 1ps
module pipelined_MAC_19BEE0032_test();
reg clk=0,reset=0;
reg [3:0] a;
reg [3:0] b;
wire [9:0] cin;
pipelined_MAC_19BEE0032 uut(clk,reset,a,b,cin);

initial begin
reset=1'b0;
clk=1'b0;
#5;
reset=1'b1;
a=$random;
b=$random;
#10;
end

always
begin
    #5 clk=~clk;
end
endmodule