`timescale 1ns / 1ps

module Indicadores(input wire [2:0] ALUControl,
                   input wire [7:0] Suma, A, B, Resultado,
                   input wire C_out,
                   output wire Carry, Overflow, Negative, Zero);

// Para Zero
Zero_1 Zero1 (.Resultado(Resultado), .Zero(Zero));

// Para Negative
Negative_1 Negative1 (.Resultado(Resultado), .Negative(Negative));

// Para Carry
Carry_1 Carry1 (.C_out(C_out), .ALUControl_1(ALUControl[1]), .Carry(Carry));

// Para Overflow
Overflow_1 Overflow1 (.A(A), .B(B), .Resultado(Resultado), .Overflow(Overflow));

endmodule
