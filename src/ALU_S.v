module ALU_S(
    input wire [7:0] A, B,
    input wire [2:0] ALUControl,
    input wire [4:0] Cantidad,
    output wire [7:0] S_M,
    output wire [7:0] Resultado,
    output wire C_out
);
    wire [7:0] B_S, Suma, SL_A, SL_B, SR_A, SR_B;

    Multiplexor_1 Multiplexor1 (.B(B), .ALUControl_0(ALUControl[0]), .B_S(B_S));
    Sumador_3 Sumador (.C_in(ALUControl[0]), .A(A), .B(B_S), .S(Suma), .C_out(C_out));
    assign S_M = Suma;
    Shifters_1 Shifters1 (.A(A), .B(B), .Cantidad(Cantidad[2:0]), .SL_A(SL_A), .SL_B(SL_B), .SR_A(SR_A), .SR_B(SR_B));
    Multiplexor_2 Multiplexor2 (.A(A), .B(B), .Suma(Suma), .Resta(Suma), .ShiftLeftA(SL_A), .ShiftRightA(SR_A), .ShiftLeftB(SL_B), .ShiftRightB(SR_B), .ALUControl(ALUControl), .Resultado(Resultado));
endmodule

