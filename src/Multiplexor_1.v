module Multiplexor_1(
    input wire [7:0] B,
    input wire ALUControl_0,
    output wire [7:0] B_S
);
    wire [7:0] z;
    assign z = ~B;
    assign B_S = ALUControl_0 ? z : B;
endmodule

