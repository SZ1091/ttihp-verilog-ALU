module Sumador_0(
    input wire A,
    input wire B,
    input wire C_in,
    output wire S,
    output wire C_out
);
    wire p, g; //nodos internos
    assign p = A ^ B;
    assign g = A & B;
    assign S = p ^ C_in;
    assign C_out = g | (p & C_in);
endmodule
