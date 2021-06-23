`timescale 1ns/1ns

module CAND(
	input A,
	input B,
	output reg C
);

always @*
begin
	C = A & B;
end

endmodule
