`timescale 1ns/1ns

module InstMEMO(
	input [31:0]Dir,
	output reg [31:0]Dout
);

reg [7:0]mem[0:399];

initial begin
		$readmemb("InstData",mem);
end

always @*
begin
	Dout = {mem[Dir], mem[Dir+1], mem[Dir+2], mem[Dir+3]};
end

endmodule
