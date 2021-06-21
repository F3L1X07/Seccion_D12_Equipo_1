`timescale 1ns/1ns

module shift_2(
	input [25:0]A,
	output reg [27:0]B
);

always @*
begin
	B = A << 2;
end

endmodule
