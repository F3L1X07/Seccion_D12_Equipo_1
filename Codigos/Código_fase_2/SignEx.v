`timescale 1ns/1ns

module SignEx(
	input [15:0]A,
	output reg[31:0]B
);

initial
begin
	B = 32'd0;
end

always @*
begin
	B = {16'd0, A};
end

endmodule
