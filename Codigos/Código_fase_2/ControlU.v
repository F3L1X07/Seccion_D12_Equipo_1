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

initial 
begin
	RegWrite = 1'b0;
end

always @*
begin
	case (OpCode)
		//tipo R
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
		//beq
		6'b000100:
		begin
			RegDst = 1'b0;
			Branch = 1'b1;
			MemRead = 1'b0;
			MemToReg = 1'b0;
			ALUOp = 3'b001;
			MemToWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b0;
		end
		//lw
		6'b100011:
		begin
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b1;
			MemToReg = 1'b1;
			ALUOp = 3'b000;
			MemToWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		//sw
		6'b101011:
		begin
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemToReg = 1'b0;
			ALUOp = 3'b000;
			MemToWrite = 1'b1;
			ALUSrc = 1'b1;
			RegWrite = 1'b0;
		end
		//addi
		6'b001000:
		begin	
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemToReg = 1'b0;
			ALUOp = 3'b000;
			MemToWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		//slti
		6'b001010:
		begin	
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemToReg = 1'b0;
			ALUOp = 3'b111;
			MemToWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		//andi
		6'b001100:
		begin	
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemToReg = 1'b0;
			ALUOp = 3'b100;
			MemToWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		//ori
		6'b001101:
		begin	
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemToReg = 1'b0;
			ALUOp = 3'b110;
			MemToWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
	endcase
end

endmodule	
