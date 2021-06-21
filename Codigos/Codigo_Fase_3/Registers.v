`timescale 1ns/1ns

module BR (
	input RegW,
	input [4:0]RA1,
	input [4:0]RA2,
	input [4:0]Dir,
	input [31:0]Din,
	output reg [31:0]DR1,
	output reg [31:0]DR2
);

reg [31:0]BanReg[0:31];

initial begin
		$readmemb("BRDatos",BanReg);
end

always @*
begin
	DR1 = BanReg[RA1];
	DR2 = BanReg[RA2];
	if (RegW == 1) begin
		BanReg[Dir] = Din;
	end
	/*else begin
		BanReg[Dir] = BanReg[Dir];
	end*/
end

endmodule
