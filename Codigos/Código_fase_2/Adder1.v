`timescale 1ns/1ns

module Adder1(
		input [31:0]A,
		input [31:0]B,
		output reg[31:0]C
);

assign B = 32'b00000000000000000000000000000100;

always @*
begin
	C = A + B;
end

endmodule
