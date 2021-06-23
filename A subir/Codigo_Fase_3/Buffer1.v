`timescale 1ns/1ns

module Buf1(
	input clk,
	input [31:0]A,
	input [31:0]B,
	output reg [31:0]C,
	output reg [31:0]D
);

initial 
begin	
	C = 32'd0;
	D = 32'd0;
end

always @(posedge clk)                                                                                               
begin 
	C = A;
	D = B;
end

endmodule
