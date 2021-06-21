`timescale 1ns/1ns

module Mux1 (
		input [4:0]A,
		input [4:0]B,
		input S,
		output reg[4:0]Sal
);



always @*
begin
	case (S)
		1'b0:
		begin
			Sal = A;
		end
		1'b1:
		begin
			Sal = B;
		end
	endcase
end

endmodule
