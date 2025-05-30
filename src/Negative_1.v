module Negative_1(
    input wire [7:0] Resultado,
    output wire Negative
);
    assign Negative = Resultado[7];
endmodule
