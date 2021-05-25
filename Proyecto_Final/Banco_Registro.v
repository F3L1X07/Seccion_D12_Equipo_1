`timescale 1ns/1ns

module Banco_Registro (
    //Inputs
    input [4:0] RA1,
    input [4:0] RA2,
    input [31:0] di,
    input [4:0] dir,
    input RW,
    
    //Outputs
    output reg[31:0] DR1,
	output reg[31:0] DR2
);

reg [31:0]mem2[0:31];
initial 
begin 
	$readmemb("datamem",mem2);
end
always @* 
begin 
	DR1<= mem2[di];
	DR2<= mem2[di];
    
	if (RW==1)
	begin 
	    mem2[dir] = di;
	end 
end

endmodule