`timescale 1ns / 1ps

module tt_um_SZ1091_ALU_Completa (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

// Mapeo de señales entre interfaz estándar y el módulo Procesamiento
wire [7:0] sw = ui_in;

wire btnL  = uio_in[0];
wire btnC  = uio_in[1];
wire btnU  = uio_in[2];
wire btnD  = uio_in[3];
wire btnR  = uio_in[4];
wire ui_7  = uio_in[5];
wire uio_6 = uio_in[6];
wire uio_7 = uio_in[7];

wire [7:0] uo;

Procesamiento proc (
    .sw(sw),
    .btnL(btnL), .btnC(btnC), .btnU(btnU), .btnD(btnD), .btnR(btnR),
    .ui_7(ui_7),
    .uio_7(uio_7),
    .uio_6(uio_6),
    .uo(uo)
);

assign uo_out = uo;

assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

endmodule

