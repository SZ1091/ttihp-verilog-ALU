module Carry_1(
    input wire C_out,
    input wire ALUControl_1,
    output wire Carry
);
    wire a;
    assign a = ~ALUControl_1;
    assign Carry = a & C_out;
endmodule

