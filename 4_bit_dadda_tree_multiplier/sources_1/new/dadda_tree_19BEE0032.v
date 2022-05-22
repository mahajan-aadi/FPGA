module ha(input a,b,output sum,cout);
    assign sum=a^b;
    assign cout=a&b;
endmodule
module fa(input a,b,cin,output sum,carry);
    assign sum=cin^a^b;
    assign carry=(a&b)|cin&(a^b);
endmodule

module dadda_tree_19BEE0032(input [3:0] a,b,output [7:0] p);
    wire [17:1] w;
    assign p[0]=a[0]&b[0];
    
    ha ha1((a[2]&b[1]),(a[3]&b[0]),w[1],w[2]);
    ha ha2((a[3]&b[1]),(a[2]&b[2]),w[3],w[4]);
    
    ha ha3((a[1]&b[1]),(a[2]&b[0]),w[5],w[6]);
    fa fa1((a[0]&b[3]),(a[1]&b[2]),w[1],w[7],w[8]);
    fa fa2((a[1]&b[3]),w[2],w[3],w[9],w[10]);
    fa fa3((a[2]&b[3]),w[4],(a[3]&b[2]),w[11],w[12]);
    
    ha ha4((a[0]&b[1]),(a[1]&b[0]),p[1],w[13]);
    fa fa4((a[0]&b[2]),w[5],w[13],p[2],w[14]);
    fa fa5((w[6]),w[7],w[14],p[3],w[15]);
    fa fa6((w[8]),w[9],w[15],p[4],w[16]);
    fa fa7((w[10]),w[11],w[16],p[5],w[17]);
    fa fa8((a[3]&b[3]),w[17],w[12],p[6],p[7]);
    

endmodule
