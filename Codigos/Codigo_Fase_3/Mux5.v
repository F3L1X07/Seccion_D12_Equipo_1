`timescale 1ns/1ns

module Mux5 (
		input [31:0]A,
		input [31:0]B,
		input S,
		output reg[31:0]Sal
);



always @*
begin
	case (S)
		1'b0:
		begin
			Sal = B;
		end
		1'b1:
		begin
			Sal = A;
		end
	endcase
end

endmodule
