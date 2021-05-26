`timescale 1ns/1ns

module Instruction_Memory (
    //Entrada
    input [15:0]pc,

    //Salida
    output [15:0]instruction
);

reg [31:0]memory[0:31];
wire [3 : 0] rom_addr = pc[4 : 1];

initial 
begin 
	$readmemb("TestF1_MemInst",memory);
end

assign instruction =  memory[rom_addr];

endmodule
