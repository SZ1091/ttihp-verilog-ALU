module SL1(
    input wire [7:0] Desplazar,
    input wire [2:0] Cantidad,
    output wire [7:0] Desplazados
);
    assign Desplazados = Desplazar << Cantidad;
endmodule

