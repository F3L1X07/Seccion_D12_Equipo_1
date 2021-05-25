`timescale 1ns/1ns

module ALU (
    input [15:0]i_op1,
    input [15:0]i_op2,
    input [2:0]selector,
    
    output reg [15:0]Aux,
    output reg [31:0]Result_op,
    output reg Zeroflag
);

always @*
begin
    //Operaciones
    case (selector)
        3'b000: //Suma
        begin
            Result_op = i_op1 + i_op2;
        end

        3'b001: //Sub
        begin
            Result_op = i_op1 - i_op2;
        end

        3'b010: //And
        begin
            Result_op = (i_op1 & i_op2);
        end

        3'b011: //Or
        begin
            Result_op = (i_op1 | i_op2);
        end

        3'b100: //NOP -> No Operation
        begin
            
        end
    endcase

    //Zeroflag
    case (Result_op)
        1'b0: 
        begin
            Zeroflag = 1;
        end

        default:
        begin
            Zeroflag = 0;
        end
    endcase
end
    
endmodule

module Tb_ALU ();
    //Declaraci�n de wires y Registros
    reg [15:0]op1; 
    reg [15:0]op2;
    reg [2:0]sel;
    wire [31:0]res;
    wire flag;

    //Cuerpo del Modulo
    /* Instanciacion del Modulo asignado */
    ALU DUV (
        .i_op1 (op1), 
        .i_op2 (op2), 
        .selector (sel),
        .Result_op (res),
        .Zeroflag (flag) 
    );

    initial 
    begin
        //ADD
        op1 = 16'd10;
        op2 = 16'd22;
        sel = 3'b000;
        #100;

        //SUB
        op1 = 16'd20;
        op2 = 16'd20;
        sel = 3'b001;
        #100; 
        
        //AND
        op1 = 16'd100;
        op2 = 16'd125;
        sel = 3'b010;
        #100;

        //OR
        op1 = 16'd90;
        op2 = 16'd30;
        sel = 3'b011;
        #100;

        //NOP
        op1 = 16'd34;
        op2 = 16'd45;
        sel = 3'b100;
        #100;

        $stop;
    end

endmodule
