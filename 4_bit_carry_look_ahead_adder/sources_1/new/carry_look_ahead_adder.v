//19BEE0032
module carry_look_ahead_adder_19BEE0032(input [3:0] a,b,input cin,output reg [4:0] s);

reg [3:0] p,g;
reg [4:0] c;
always @ *
begin
    p=a^b;
    g=a&b;

    c[0]=cin;    
    c[1]=(p[0]&c[0])|g[0];
    c[2]=(p[1]&p[0]&c[0])|(p[1]&g[0])|g[1];
    c[3]=(p[2]&p[1]&p[0]&c[0])|(p[2]&p[1]&g[0])|
            (p[2]&g[1])|g[2];
    c[4]=(p[3]&p[2]&p[1]&p[0]&c[0])|(p[3]&p[2]&p[1]&g[0])|
        (p[3]&p[2]&g[1])|(p[3]&g[2])|g[3];
        
    s[3:0]=p^c[3:0];
    s[4]=c[4];
    
end
endmodule
