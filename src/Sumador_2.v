`timescale 1ns / 1ps

module Sumador_2(A, B, C_in, S, C_out);

    input [3:0] A, B;       // 4 bits de entrada
    input C_in;
    output [3:0] S;
    output C_out;

    wire [3:0] A, B;
    wire C_in;
    wire [3:0] S;
    wire C_out;

    wire c_internal;

    Sumador_1 Sumador03 (
        .A(A[1:0]),
        .B(B[1:0]),
        .C_in(C_in),
        .S(S[1:0]),
        .C_out(c_internal)
    );

    Sumador_1 Sumador04 (
        .A(A[3:2]),
        .B(B[3:2]),
        .C_in(c_internal),
        .S(S[3:2]),
        .C_out(C_out)
    );

endmodule
