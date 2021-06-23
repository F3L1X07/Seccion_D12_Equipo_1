`timescale 1ns/1ns

module shift(
	input [31:0]A,
	output reg [31:0]B
);

always @*
begin
	B = A << 2;
end

endmodule
