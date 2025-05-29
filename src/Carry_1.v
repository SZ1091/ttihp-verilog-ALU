`timescale 1ns / 1ps

module Carry_1(input wire C_out, ALUControl_1,
               output wire Carry);

wire a;
assign a = ~ALUControl_1;   // Aplica NOT a ALUControl_1
assign Carry = a & C_out;   // Calcula la salida con la compuerta AND

endmodule
