`timescale 1ns/1ns

module tb_General (
//Declaraci�n de wires y Registros
//Entradas
reg [15:0]op1; 
reg [15:0]op2;
reg [2:0]sel;

//Salidas
wire [31:0]res;
wire flag;

//Cuerpo del Modulo
/* Instanciacion del Modulo asignado */
<Modulo> <Instancia> (
    //Conexiones
    .i_op1 (op1), 
    .i_op2 (op2), 
    .selector (sel),
    .Result_op (res),
    .Zeroflag (flag) 
);

//Ingreso de Valores
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
