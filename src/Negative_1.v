`timescale 1ns / 1ps

module Negative_1(input wire [7:0] Resultado,
                  output wire Negative);

assign Negative = Resultado[7]; // Extrae el bit más significativo para indicar si el número es negativo

endmodule
