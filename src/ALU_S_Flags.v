module ALU_S_Flags(
    input wire [7:0] A, B,
    input wire [2:0] ALUControl,
    input wire [1:0] Cantidad,  // Ajustado a 3 bits como el módulo ALU_S
    output wire [7:0] Resultado,
    output wire Carry,
    output wire Overflow,
    output wire Negative,
    output wire Zero
);

    wire [7:0] S_M;
    wire C_out;

    // Para ALU_S
    ALU_S ALU_1 (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Cantidad(Cantidad),
        .S_M(S_M),
        .C_out(C_out),
        .Resultado(Resultado)
    );

    // Para Indicadores
    Indicadores Indicadores1 (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Suma(S_M),
        .C_out(C_out),
        .Resultado(Resultado),
        .Carry(Carry),
        .Overflow(Overflow),
        .Negative(Negative),
        .Zero(Zero)
    );

endmodule
