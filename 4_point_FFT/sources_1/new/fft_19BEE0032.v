module acc_4bit(input[3:0]d,input clk,rst,output reg[3:0]q); 
  always@(posedge clk or negedge rst) 
  if(!rst) 
    q <= 4'b0000; 
  else 
    q <= d; 
endmodule  
 
module fir_19BEE0032(input [3:0]x,input clk,rst,output [9:0]y); 
wire[3:0] w1,w2,w3,w4; 
wire[7:0] w5,w6,w7,w8; 
wire[9:0] w9,w10; 

parameter b0 = 4'b0001; 
parameter b1 = 4'b0010; 
parameter b2 = 4'b0011; 
parameter b3 = 4'b0100; 

acc_4bit r1(x,clk,rst,w1); 
acc_4bit r2(w1,clk,rst,w2); 
acc_4bit r3(w2,clk,rst,w3); 
acc_4bit r4(w3,clk,rst,w4); 

assign w5=w1*b0; 
assign w6=w2*b1; 
assign w7=w3*b2; 
assign w8=w4*b3; 

assign w9=w5+w6; 
assign w10=w9+w7; 

assign y=w10+w8; 
endmodule