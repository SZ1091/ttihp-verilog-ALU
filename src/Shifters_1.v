module Shifters_1(
    input wire [7:0] A, B,
    input wire [2:0] Cantidad,
    output wire [7:0] SL_A, SR_A, SL_B, SR_B
);
    SL1 SLA (.Desplazar(A), .Cantidad(Cantidad), .Desplazados(SL_A));
    SR1 SRA (.Desplazar(A), .Cantidad(Cantidad), .Desplazados(SR_A));
    SL1 SLB (.Desplazar(B), .Cantidad(Cantidad), .Desplazados(SL_B));
    SR1 SRB (.Desplazar(B), .Cantidad(Cantidad), .Desplazados(SR_B));
endmodule
