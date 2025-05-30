module Sumador_1(
    input wire [1:0] A, B, // 2 bits de entrada
    input wire C_in,
    output wire [1:0] S,
    output wire C_out
);
    wire c_internal;
    Sumador_0 Sumador01 (.A(A[0]), .B(B[0]), .C_in(C_in), .S(S[0]), .C_out(c_internal));
    Sumador_0 Sumador02 (.A(A[1]), .B(B[1]), .C_in(c_internal), .S(S[1]), .C_out(C_out));
endmodule

