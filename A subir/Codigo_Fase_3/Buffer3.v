`timescale 1ns/1ns

module Buf3(
	input clk,
	input jump,
	input [31:0]shift_2,
	input [1:0]WB,
	input [2:0]M,
	input [31:0]A,
	input B,
	input [31:0]C,
	input [31:0]D,
	input [4:0]E,
	input [31:0]Add1,
	output reg [1:0]WBSal,
	output reg BranchSal,
	output reg [31:0]ASal,
	output reg BSal,
	output reg MemRSal,
	output reg MemWSal,
	output reg [31:0]CSal,
	output reg [31:0]DSal,
	output reg [4:0]ESal,
	output reg [31:0]Buf3ToMux4,
	output reg [31:0]shift_sal,
	output reg jumpsal
);

initial 
begin	
	WBSal = 2'd0;
	BSal = 1'd0;
	MemRSal = 1'd0;
	MemWSal = 1'b0;
	ASal = 32'd0;
	BSal = 1'd0;
	CSal = 32'd0;
	DSal = 32'd0;
	ESal = 5'd0;
	Buf3ToMux4 = 32'd0;
	shift_sal = 32'd0;
	jumpsal = 1'b0;
end

always @(posedge clk)                                                                                               
begin 
	WBSal = WB;
	BranchSal = M[2];
	MemRSal = M[1];
	MemWSal = M[0];
	ASal = A;
	BSal = B;
	CSal = C;
	DSal = D;
	ESal = E;
	Buf3ToMux4 = Add1;
	shift_sal = shift_2;
	jumpsal = jump;
end

endmodule
