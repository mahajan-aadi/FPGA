module fa(input a,b,cin,output sum,carry);
assign sum=cin^a^b;
assign carry=(a&b)|cin&(a^b);
endmodule

module ha(input a,b,output sum,cout);
assign sum=a^b;
assign cout=a&b;
endmodule

module four_bit_squarer_19BEE0032(input [3:0]a, output [7:0]p);
wire [4:1] w;
assign p[0]=a[0];
assign p[1]=0;
assign p[2]=(~a[0])&a[1];
ha h1((a[2]&a[0]),(a[1]&a[0]),p[3],w[1]);
fa f1((a[2]&(~a[1])),(a[3]&a[0]),w[1],p[4],w[2]);
fa f2((a[2]&a[1]),(a[3]&a[1]),w[2],p[5],w[3]);
ha h2(((~a[2])&a[3]),w[3],p[6],w[4]);
assign p[7]=((a[3]&a[2])^w[4]);
endmodule
