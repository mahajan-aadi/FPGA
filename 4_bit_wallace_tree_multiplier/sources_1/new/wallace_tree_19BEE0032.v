module ha(input a,b,output sum,cout);
    assign sum=a^b;
    assign cout=a&b;
endmodule
module fa(input a,b,cin,output sum,carry);
    assign sum=cin^a^b;
    assign carry=(a&b)|cin&(a^b);
endmodule

module wallace_tree_19BEE0032(input [3:0] a,b,output [7:0] p);
    wire [23:1] w;
    assign p[0]=a[0]&b[0];
    
    ha ha1((a[0]&b[1]),(a[1]&b[0]),p[1],w[1]);
    fa fa1((a[2]&b[0]),(a[1]&b[1]),(a[0]&b[2]),w[2],w[3]);
    fa fa2((a[3]&b[0]),(a[2]&b[1]),(a[1]&b[2]),w[4],w[5]);
    fa fa3((a[3]&b[1]),(a[2]&b[2]),(a[1]&b[3]),w[6],w[7]);
    ha ha2((a[3]&b[2]),(a[2]&b[3]),w[8],w[9]);
    
    ha ha3(w[1],w[2],p[2],w[10]);
    fa fa4(w[3],w[4],(a[0]&b[3]),w[11],w[12]);
    ha ha4(w[5],w[6],w[13],w[14]);
    ha ha5(w[7],w[8],w[15],w[16]);
    ha ha6(w[9],(a[3]&b[3]),w[17],w[18]);
    
    ha ha7(w[10],w[11],p[3],w[19]);
    fa fa5(w[12],w[13],w[19],p[4],w[20]);
    fa fa6(w[14],w[15],w[20],p[5],w[21]);
    fa fa7(w[16],w[17],w[21],p[6],w[22]);
    ha ha8(w[18],w[22],p[7],w[23]);
endmodule
