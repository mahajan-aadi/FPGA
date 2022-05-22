module dct_19BEE0032(input signed[3:0] x0,x1,x2,x3, output signed [6:0] y0,y1,y2,y3);
wire signed [5:0] w1,w2,w3,w4;

parameter c1=2; 
parameter c2=3; 
parameter c3=4; 

assign w1=x0+x3;
assign w2=x0-x3;
assign w3=x1+x2;
assign w4=x1-x2;

assign y0=(w3+w1)*c2;
assign y2=(w3-w1)*c2;
assign y1=(c1*w2+c3*w4);
assign y3=(c3*w2-c1*w4);
endmodule
