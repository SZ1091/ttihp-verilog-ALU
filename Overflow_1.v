`timescale 1ns / 1ps

module Overflow_1(input wire [7:0] A, B, Resultado,
                  output wire Overflow);

assign Overflow = (A[7] == B[7]) && (A[7] != Resultado[7]); 

endmodule
