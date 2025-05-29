`timescale 1ns / 1ps

module Sumador_3(input wire [7:0] A, B, // 8 bits de entrada
                 input wire C_in,
                 output wire [7:0] S,
                 output wire C_out);

wire c_internal;

Sumador_2 Sumador05 (.A(A[3:0]), .B(B[3:0]), .C_in(C_in), .S(S[3:0]), .C_out(c_internal)); 
Sumador_2 Sumador06 (.A(A[7:4]), .B(B[7:4]), .C_in(c_internal), .S(S[7:4]), .C_out(C_out));

endmodule
