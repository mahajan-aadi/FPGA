module acc_4_bit(input clk, reset,input [3:0] d,output reg [3:0] q);
always @(posedge clk,negedge reset)
begin
    if(!reset)
        q<='b0;
    else
        q<=d;
end
endmodule
module acc_8_bit(input clk,reset,input [7:0] d,output reg [7:0] q);
always @(posedge clk,negedge reset)
begin
    if(!reset)
        q<='b0;
    else
        q<=d;
end
endmodule
module acc_10_bit(input clk,reset,input [9:0] d,output reg [9:0] q);
always @(posedge clk,negedge reset)
begin
    if(!reset)
        q<='b0;
    else
        q<=d;
end
endmodule

module pipelined_MAC_19BEE0032(input clk,reset,input [3:0] a,input [3:0] b, output [9:0] cin);
        wire [3:0] w1,w2;
        wire [7:0] w3,w4;
        wire [9:0] w5,w6;
        acc_4_bit a1(clk,reset,a,w1);
        acc_4_bit a2(clk,reset,b,w2);
        assign w3=w2*w1;
        acc_8_bit a3(clk,reset,w3,w4);
        assign w5=w4+w6;
        acc_10_bit a4(clk,reset,w5,w6);
        assign cin=w6;
endmodule
