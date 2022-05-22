`timescale 1ns / 1ps 
module FIR_filter_testbench; 
reg [3:0] x; 

reg clk,rst; 
wire [9:0] y; 
fir_19BEE0032 uut (x,clk,rst,y); 

initial begin 
rst = 1'b0; 
clk = 1'b1; 
#5; 
rst = 1'b1; 
x = 4'b0001;  
#10; 
x = 4'b0010; 
#10; 
x = 4'b0011;  
#10; 
x = 4'b0100; 
#10; 
x = 4'b0000; 
#10;
end 
always #5 clk = ~clk; 
endmodule 