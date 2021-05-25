`timescale 1ns/1ns

//MUX de entrada de la instrucción de memoria
module MUX_1 (
    input [3:0]A,
    input [3:0]B,
    input S,
    output reg[3:0]y 
);

always @*
begin
    case (S)
        1'b0:
        begin
           y = A; 
        end 

        2'b1:
        begin
            y = B;
        end
    endcase     
end

endmodule

//MUX de entrada de Banco de Registros
module MUX_2 (
    input [31:0]A,
    input [31:0]B,
    input S,
    output reg[31:0]y 
);

always @*
begin
    case (S)
        1'b0:
        begin
           y = A; 
        end 

        2'b1:
        begin
            y = B;
        end
    endcase     
end

endmodule

//MUX de entrada del Add_1
module MUX_3 (
    input [31:0]A,
    input [31:0]B,
    input S,
    output reg[31:0]y 
);

always @*
begin
    case (S)
        1'b0:
        begin
           y = A; 
        end 

        2'b1:
        begin
            y = B;
        end
    endcase     
end

endmodule

//MUX de entrada de la Data Memory
module MUX_4 (
    input [31:0]A,
    input [31:0]B,
    input S,
    output reg[31:0]y 
);

always @*
begin
    case (S)
        1'b0:
        begin
           y = A; 
        end 

        2'b1:
        begin
            y = B;
        end
    endcase     
end

endmodule
