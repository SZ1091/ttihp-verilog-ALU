`timescale 1ns / 1ps

module Multiplexor_2(input wire [7:0] A, B, Suma, Resta, ShiftLeftA, ShiftRightA, ShiftLeftB, ShiftRightB,
                     input wire [2:0] ALUControl,
                     output wire [7:0] Resultado);

wire [7:0] y, z;
assign y = A & B;
assign z = A | B;

assign Resultado = (ALUControl == 3'b000) ? Suma :   // Selección de salida según ALUControl
                   (ALUControl == 3'b001) ? Resta :
                   (ALUControl == 3'b010) ? y :
                   (ALUControl == 3'b011) ? z :
                   (ALUControl == 3'b100) ? ShiftLeftA :
                   (ALUControl == 3'b101) ? ShiftRightA :
                   (ALUControl == 3'b110) ? ShiftLeftB :
                                            ShiftRightB;

endmodule
