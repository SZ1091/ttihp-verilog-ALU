`timescale 1ns / 1ps

module Shifters_1(input wire [7:0] A, B,
                  input wire [4:0] Cantidad,
                  output wire [7:0] SL_A, SR_A, SL_B, SR_B);

// Para Shift Left A
SL1 SLA (.Desplazar(A), .Cantidad(Cantidad), .Desplazados(SL_A));

// Para Shift Right A
SR1 SRA (.Desplazar(A), .Cantidad(Cantidad), .Desplazados(SR_A));

// Para Shift Left B
SL1 SLB (.Desplazar(B), .Cantidad(Cantidad), .Desplazados(SL_B));

// Para Shift Right B
SR1 SRB (.Desplazar(B), .Cantidad(Cantidad), .Desplazados(SR_B));

endmodule
