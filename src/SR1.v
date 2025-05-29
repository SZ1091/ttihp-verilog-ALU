`timescale 1ns / 1ps

module SR1(input wire [7:0] Desplazar,  // Entrada de 8 bits
           input wire [4:0] Cantidad,   // Señal de control para el desplazamiento
           output wire [7:0] Desplazados);  // Salida de 8 bits desplazados

assign Desplazados = Desplazar >> Cantidad;  // Desplazamiento lógico a la derecha

endmodule
