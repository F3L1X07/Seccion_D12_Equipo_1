`timescale 1ns/1ns

module Buf2(
	input clk,
	input jump,
	input [27:0]shift_2,
	input [1:0]WB,
	input [2:0]M,
	input [4:0]EX,
	input [31:0]A,
	input [31:0]B,
	input [31:0]C,
	input [31:0]D,
	input [4:0]E,
	input [4:0]F,
	output reg [1:0]WBSal,
	output reg [2:0]MSal,
	output reg RegDst,
	output reg [2:0]ALUOp,
	output reg ALUSrc,
	output reg [31:0]ASal,
	output reg [31:0]BSal,
	output reg [31:0]CSal,
	output reg [31:0]DSal,
	output reg [4:0]ESal,
	output reg [4:0]FSal,
	output reg [31:0]Shift_2Sal,
	output reg jumpsal
);

initial 
begin	
	WBSal = 2'd0;
	MSal = 3'd0;
	RegDst = 1'd0;
	ALUOp = 3'd0;
	ALUSrc = 1'd0;
	ASal = 32'd0;
	BSal = 32'd0;
	CSal = 32'd0;
	DSal = 32'd0;
	ESal = 5'd0;
	FSal = 5'd0;
	Shift_2Sal = 32'd0;
	jumpsal = 1'b0;
end

always @(posedge clk)                                                                                               
begin 
	WBSal = WB;
	MSal = M;
	RegDst = EX[4];
	ALUOp = EX[3:1];
	ALUSrc = EX[0];
	ASal = A;
	BSal = B;
	CSal = C;
	DSal = D;
	ESal = E;
	FSal = F;
	Shift_2Sal = {A[31:28] ,shift_2};
	jumpsal = jump;
end

endmodule
