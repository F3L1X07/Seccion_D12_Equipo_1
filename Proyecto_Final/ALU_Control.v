`timescale 1ns/1ns

module ALU_Control (
    //Entradas
    input [1:0]ALUOp,
    input [3:0]OpCode,

    //Salidas
    output reg [2:0]ALU_Cnt
);

//Cables y Registros
wire [5:0]ALUControlIn;

endmodule