`timescale 1ns / 1ps

module Sumador_1(A, B, C_in, S, C_out);

    input [1:0] A, B;       // 2 bits de entrada
    input C_in;
    output [1:0] S;
    output C_out;

    wire [1:0] A, B;
    wire C_in;
    wire [1:0] S;
    wire C_out;

    wire c_internal;

    Sumador_0 Sumador01 (
        .A(A[0]),
        .B(B[0]),
        .C_in(C_in),
        .S(S[0]),
        .C_out(c_internal)
    );

    Sumador_0 Sumador02 (
        .A(A[1]),
        .B(B[1]),
        .C_in(c_internal),
        .S(S[1]),
        .C_out(C_out)
    );

endmodule

