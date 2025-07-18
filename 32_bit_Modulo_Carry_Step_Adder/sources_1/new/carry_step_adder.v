`timescale 1ns / 1ps

module carry_step_Modu_adder( input [31:0] a,b,output [31:0] s );
    wire [32:0] carry; 
    wire [32:0] carry_2; 

    wire [32:0] out_1; 
    wire [32:0] out_2; 
    wire [7:0] carrys; 
    
    genvar i;
    genvar block, bit;
     
    fa fa1 (a[0], b[0], 1'b0, s[0], carry[0]);
    fa fa2 (a[1], b[1], carry[0], s[1], carry[1]);
    fa fa3 (a[2], b[2], carry[1], s[2], carry[2]);
    fa fa4 (a[3], b[3], carry[2], s[3], carry[3]);

generate

    for (bit = 4; bit <= 31; bit = bit + 1) begin: bits

      // condition 0 full adder
      fa fa_cond0 (
        .a(a[bit]),
        .b(b[bit]),
        .cin((bit % 4 == 0) ? 1'b0 : carry[bit-1]),
        .sum(out_1[bit]),
        .cout(carry[bit])
      );

      // condition 1 full adder
      fa fa_cond1 (
        .a(a[bit]),
        .b(b[bit]),
        .cin((bit % 4 == 0) ? 1'b1 : carry_2[bit-1]),
        .sum(out_2[bit]),
        .cout(carry_2[bit])
      );
    end
endgenerate
   
    //carrys
    assign carrys[0]=carry[3];
    MUX_21 c1 (carry[7],carry_2[7],carrys[0], carrys[1]);
    MUX_21 c2 (carry[11],carry_2[11],carrys[1], carrys[2]);
    MUX_21 c3 (carry[15],carry_2[15],carrys[2], carrys[3]);
    MUX_21 c4 (carry[19],carry_2[19],carrys[3], carrys[4]);
    MUX_21 c5 (carry[23],carry_2[23],carrys[4], carrys[5]);
    MUX_21 c6 (carry[27],carry_2[27],carrys[5], carrys[6]);

wire [2:0] carry_index;

generate
    for (i = 4; i < 32; i = i + 1) begin : gen_muxes

        MUX_21 mux_inst (
            .a(out_1[i]),
            .b(out_2[i]),
            .inp(carrys[(i - 4) >> 2]),
            .out(s[i])
        );
    end
endgenerate

 endmodule
