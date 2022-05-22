module fa(input a,b,cin, output sum,cout);
assign sum = a^(b^cin);
assign cout=(a&b)|cin&(a^b);
endmodule

module Bough_Wooley_array_multiplier_19BEE0032(input [3:0]a,b,output [7:0] P );
wire [18:1] w;
assign P[0]=a[0]&b[0];

fa f1((a[1]&b[0]),(a[0]&b[1]),0,P[1],w[1]);
fa f2((a[2]&b[0]),(a[1]&b[1]),0,w[2],w[3]);
fa f3((~(a[3]&b[0])),(a[2]&b[1]),0,w[4],w[5]);

fa f4(w[2],(a[0]&b[2]),w[1],P[2],w[6]);
fa f5(w[4],(a[1]&b[2]),w[3],w[7],w[8]);
fa f6((~(a[3]&b[1])),(a[2]&b[2]),w[5],w[9],w[10]);

fa f7(w[7],(~(a[0]&b[3])),w[6],P[3],w[11]);
fa f8(w[9],(~(a[1]&b[3])),w[8],w[12],w[13]);
fa f9((~(a[3]&b[2])),(~(a[2]&b[3])),w[10],w[14],w[15]);

fa f10(w[11],w[12],1,P[4],w[16]);
fa f11(w[13],w[14],w[16],P[5],w[17]);
fa f12(w[15],(a[3]&b[3]),w[17],P[6],w[18]);
assign P[7]=w[18]^1;
endmodule