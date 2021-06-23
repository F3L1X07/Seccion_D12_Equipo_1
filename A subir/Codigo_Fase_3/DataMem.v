`timescale 1ns/1ns

module MEMO(
	input Ew,
	input Er,
	input [4:0]Dir,
	input [31:0]Din,
	output reg [31:0]Dout
);

reg [31:0]mem[0:31];

initial begin
		$readmemb("DataMEMO",mem);
end

always @*
begin
	if (Ew == 1)begin
		//escritura
		mem[Dir] = Din;
	end
	else if (Er == 1)begin
		//lectura
		Dout = mem[Dir];
	end
end

endmodule
