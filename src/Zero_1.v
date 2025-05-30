module Zero_1(
    input wire [7:0] Resultado,
    output wire Zero
);
    assign Zero = (Resultado == 8'b00000000);
endmodule

