`timescale 1ns/1ns

module TB_PF3();

reg CLK = 1'b0;

PF3 TB_PCPF1(
	.CLK(CLK)
);

always @* 
begin
	#100 CLK <= ~CLK;
end

initial
begin
	#20000;
	$stop;
end

endmodule
