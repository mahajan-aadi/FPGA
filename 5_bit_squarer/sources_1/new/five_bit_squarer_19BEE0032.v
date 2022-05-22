module fa(input a,b,cin,output sum,carry);
assign sum=cin^a^b;
assign carry=(a&b)|cin&(a^b);
endmodule

module ha(input a,b,output sum,cout);
assign sum=a^b;
assign cout=a&b;
endmodule

module five_bit_squarer_19BEE0032(input [4:0]a, output [9:0]p);
wire [12:1] w;
assign p[0]=a[0];
assign p[1]=0;
assign p[2]=(~a[0])&a[1];
ha h1((a[2]&a[0]),(a[1]&a[0]),p[3],w[1]);
fa f1((a[2]&(~a[1])),(a[3]&a[0]),w[1],p[4],w[2]);

fa f2((a[0]&a[4]),(a[3]&a[1]),(a[2]&a[1]),w[3],w[4]);
ha h2(w[2],w[3],p[5],w[5]);

ha h3(((~a[2])&a[3]),(a[4]&a[1]),w[6],w[7]);
fa f3(w[6],w[4],w[5],p[6],w[8]);

ha h4((a[2]&a[3]),(a[4]&a[2]),w[9],w[10]);
fa f4(w[9],w[7],w[8],p[7],w[11]);

fa f5(((~a[3])&a[4]),w[10],w[11],p[8],w[12]);

assign p[9]=((a[3]&a[4])^w[12]);
endmodule
