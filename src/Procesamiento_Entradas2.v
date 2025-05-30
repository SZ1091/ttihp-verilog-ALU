module Procesamiento_Entradas2(
  input  wire [7:0] sw,    // Datos de entrada
  input  wire  uio_7,     // 0: A, 1: B
  input  wire  uio_6,    // Pulso para guardar
  output logic [7:0] A,
  output logic [7:0] B
);

    logic [7:0] A_reg = 8'd0;
    logic [7:0] B_reg = 8'd0;

  always_ff @(posedge uio_6) begin
    if (uio_7 == 1'b0)
            A_reg <= sw;
        else
            B_reg <= sw;
    end

    assign A = A_reg;
    assign B = B_reg;

endmodule
