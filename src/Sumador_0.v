`timescale 1ns / 1ps

module Sumador_0(A, B, C_in, S, C_out);

    input A, B, C_in;
    output S, C_out;

    wire A, B, C_in;
    wire S, C_out;

    wire p, g; // nodos internos

    assign p = A ^ B;
    assign g = A & B;
    assign S = p ^ C_in;
    assign C_out = g | (p & C_in);

endmodule

