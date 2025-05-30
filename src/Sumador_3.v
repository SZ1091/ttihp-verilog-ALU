`timescale 1ns / 1ps

module Sumador_3(A, B, C_in, S, C_out);

    input [7:0] A, B;       // 8 bits de entrada
    input C_in;
    output [7:0] S;
    output C_out;

    wire [7:0] A, B;
    wire C_in;
    wire [7:0] S;
    wire C_out;

    wire c_internal;

    Sumador_2 Sumador05 (
        .A(A[3:0]),
        .B(B[3:0]),
        .C_in(C_in),
        .S(S[3:0]),
        .C_out(c_internal)
    );

    Sumador_2 Sumador06 (
        .A(A[7:4]),
        .B(B[7:4]),
        .C_in(c_internal),
        .S(S[7:4]),
        .C_out(C_out)
    );

endmodule
