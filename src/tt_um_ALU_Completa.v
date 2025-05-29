`timescale 1ns / 1ps

module tt_um_ALU_Completa(input wire [15:0] sw,
                    input wire btnL, btnC, btnU, btnD, btnR,
                    output wire [12:0] led);   // Elementos reales

wire [1:0] Cantidad;
wire [2:0] ALUControl;

// Para Procesamiento_Entradas
Procesamiento_Entradas Entradas (.btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .btnC(btnC), .ALUControl(ALUControl), .Cantidad(Cantidad));

// Para ALU_S_Flags
ALU_S_Flags ALU_F (.A(sw[7:0]), .B(sw[15:8]), .ALUControl(ALUControl), .Cantidad(Cantidad), .Resultado(led[7:0]), .Carry(led[12]), .Overflow(led[11]), .Negative(led[10]), .Zero(led[9]));

// Para Procesamiento_Salidas
// Procesamiento_Salidas Salidas(.Resultado(Resultado), .btnL(btnL), .btnC(btnC), .led(led[7:0]));

endmodule
