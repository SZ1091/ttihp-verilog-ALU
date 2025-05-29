`timescale 1ns / 1ps

module Procesamiento_Entradas(input wire btnL, btnC, btnU, btnD, btnR,
                              output wire [2:0] ALUControl,
                              output wire [1:0] Cantidad);

always @* begin
    case ({btnL, btnC, btnR}) // Concatenamos los botones para simplificar condiciones
        3'b000: ALUControl = 3'b000;   
        3'b001: ALUControl = 3'b001;
        3'b010: ALUControl = 3'b010;
        3'b011: ALUControl = 3'b011;
        3'b100: ALUControl = 3'b100;   
        3'b101: ALUControl = 3'b101;
        3'b110: ALUControl = 3'b110;
        3'b111: ALUControl = 3'b111;
        default: ALUControl = 3'b000;
    endcase
end

always @* begin
    case ({btnU, btnD}) // Concatenamos los botones para simplificar condiciones
        2'b00: Cantidad = 2'b00;   
        2'b01: Cantidad = 2'b01;
        2'b10: Cantidad = 2'b10;
        2'b11: Cantidad = 2'b11;
        default: Cantidad = 2'b00;
    endcase
end

endmodule
