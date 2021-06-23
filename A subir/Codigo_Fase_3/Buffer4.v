`timescale 1ns/1ns

module Buf4(
	input clk,
	input [1:0]WB,
	input [31:0]A,
	input [31:0]B,
	input [4:0]C,
	output reg RegW,
	output reg MemToReg,
	output reg [31:0]Asal,
	output reg [31:0]BSal,
	output reg [4:0]Csal
);

initial 
begin	
	RegW = 1'd0;
	MemToReg = 1'd0;
	Asal = 32'd0;
	BSal = 32'd0;
	Csal = 5'd0;
end

always @(posedge clk)                                                                                               
begin 
	RegW = WB[1];
	MemToReg = WB[0];
	Asal = A;
	BSal = B;
	Csal = C;
end

endmodule
