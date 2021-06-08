`timescale 1ns/1ns

module UC (
	input [5:0] OpCode,
	output reg RegDst,
	output reg Branch,
	output reg MemRead,
	output reg MemToReg,
	output reg [2:0] ALUOp,
	output reg MemToWrite,
	output reg ALUSrc,
	output reg RegWrite
);

always @*
begin
	case (OpCode)
		6'b000000:
		begin	
			RegDst = 1'b1;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemToReg = 1'b0;
			ALUOp = 3'b010;
			MemToWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b1;
		end
	endcase
end

endmodule	
