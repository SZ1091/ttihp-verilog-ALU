`timescale 1ns / 1ps

module Multiplexor_1(B, ALUControl_0, B_S);

    input [7:0] B;              // Entrada de 8 bits
    input ALUControl_0;         // Señal de control
    output [7:0] B_S;           // Salida de 8 bits

    wire [7:0] B;
    wire ALUControl_0;
    wire [7:0] B_S;

    wire [7:0] z;

    assign z = ~B;                      // Niega cada bit de B
    assign B_S = ALUControl_0 ? z : B;  // Mux controlado por ALUControl_0

endmodule
