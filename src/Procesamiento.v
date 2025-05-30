`timescale 1ns / 1ps

module Procesamiento(input wire [7:0] sw,
                    input wire btnL, btnC, btnU, btnD, btnR, ui_7, uio_7, uio_6, // ui_7 es el interruptor
                    output wire [7:0] uo); // Salidas ajustadas

wire [1:0] Cantidad;
wire [2:0] ALUControl;
wire [7:0] resultado;
wire Carry, Overflow, Negative, Zero;
wire [7:0] A, B;

// Procesamiento de entradas
Procesamiento_Entradas Entradas (.btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .btnC(btnC), .ALUControl(ALUControl), .Cantidad(Cantidad));

//Procesamiento entradas2
  Procesamiento_Entradas2 Entradas2(.sw(sw), .uio_7(uio_7), .uio_6(uio_6), .A(A), .B(B));

// ALU con flags
  ALU_S_Flags ALU_F (.A(A), .B(B), .ALUControl(ALUControl), .Cantidad(Cantidad), .Resultado(resultado), .Carry(Carry), .Overflow(Overflow), .Negative(Negative), .Zero(Zero));

// Multiplexor para cambiar entre salida de resultado e indicadores
assign uo = (ui_7 == 0) ? resultado : {4'b0, Carry, Overflow, Negative, Zero};

endmodule
