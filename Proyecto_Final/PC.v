`timescale 1ns/1ns

module PC (
    //Entradas
    input [31:0]A,
    input CLK,

    //Salidas
    output reg[31:0]S
);

always @(posedge CLK)     
begin                                                     
    S = A;
end

endmodule
