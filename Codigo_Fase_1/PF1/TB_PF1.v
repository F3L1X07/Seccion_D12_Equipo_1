`timescale 1ns/1ns

module TB_PF1();

reg CLK = 1'b0;

PF1 TB_PCPF1(
	.CLK(CLK)
);

always @* 
begin
	#100 CLK <= ~CLK;
end

initial
begin
	#1200;
	$stop;
end

endmodule
