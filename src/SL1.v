`timescale 1ns / 1ps

module SL1(
    Desplazar,
    Cantidad,
    Desplazados
);

    input [7:0] Desplazar;         // Entrada de 8 bits
    input [2:0] Cantidad;          // Cantidad de desplazamiento (0 a 7)
    output [7:0] Desplazados;      // Salida de 8 bits desplazados

    wire [7:0] Desplazar;
    wire [2:0] Cantidad;
    wire [7:0] Desplazados;

    assign Desplazados = Desplazar << Cantidad;   // Desplazamiento lógico a la izquierda

endmodule

