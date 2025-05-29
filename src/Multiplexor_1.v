`timescale 1ns / 1ps

module Multiplexor_1(input wire [7:0] B,  // Entrada de 8 bits
                     input wire ALUControl_0,   // Señal de control para el multiplexor
                     output wire [7:0] B_S);  // Salida de 8 bits

wire [7:0] z;  

assign z = ~B;  // Niega cada bit de B
assign B_S = ALUControl_0 ? z : B;  // Asigna la salida dependiendo de la señal de control ALUControl_0

endmodule
