`timescale 1ns / 1ps

module ALU_S_Flags(input wire [7:0] A, B, 
                   input wire [2:0] ALUControl,
                   input wire [4:0] Cantidad,
                   output wire [7:0] Resultado,
                   output wire Carry, Overflow, Negative, Zero);

wire S_M, C_out;

// Para ALU_S
ALU_S ALU_1 (.B(B), .A(A), .Cantidad(Cantidad), .ALUControl(ALUControl), .S_M(S_M), .C_out(C_out), .Resultado(Resultado));

// Para Indicadores
Indicadores Indicadores1 (.B(B), .A(A), .ALUControl(ALUControl), .Suma(S_M), .C_out(C_out), .Resultado(Resultado), .Carry(Carry), .Overflow(Overflow), .Negative(Negative), .Zero(Zero));

endmodule
