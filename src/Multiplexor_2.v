`timescale 1ns / 1ps

module Multiplexor_2(
    A, B, Suma, Resta, ShiftLeftA, ShiftRightA, ShiftLeftB, ShiftRightB,
    ALUControl,
    Resultado
);

    input [7:0] A, B, Suma, Resta, ShiftLeftA, ShiftRightA, ShiftLeftB, ShiftRightB;
    input [2:0] ALUControl;
    output [7:0] Resultado;

    wire [7:0] A, B, Suma, Resta, ShiftLeftA, ShiftRightA, ShiftLeftB, ShiftRightB;
    wire [2:0] ALUControl;
    wire [7:0] Resultado;

    wire [7:0] y, z;

    assign y = A & B;
    assign z = A | B;

    assign Resultado = (ALUControl == 3'b000) ? Suma :
                       (ALUControl == 3'b001) ? Resta :
                       (ALUControl == 3'b010) ? y :
                       (ALUControl == 3'b011) ? z :
                       (ALUControl == 3'b100) ? ShiftLeftA :
                       (ALUControl == 3'b101) ? ShiftRightA :
                       (ALUControl == 3'b110) ? ShiftLeftB :
                                                ShiftRightB;

endmodule

