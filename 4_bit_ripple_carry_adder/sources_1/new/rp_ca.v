module fa(input a,b,cin, output sum,cout);
    assign sum = a^(b^cin);
    assign cout=(a&b)|cin&(a^b);
endmodule

module rp_ca_19BEE0032(input [3:0] a,b,input cin,output [4:0] s );
wire w1,w2,w3;
fa fa1(a[0],b[0],cin,s[0],w1);
fa fa2(a[1],b[1],w1,s[1],w2);
fa fa3(a[2],b[2],w2,s[2],w3);
fa fa4(a[3],b[3],w3,s[3],s[4]);
endmodule
