`timescale 1ns/1ns

module PC(
	input clk,
	input [31:0]A,
	output reg [31:0]B
);

initial 
begin	
	B = 32'd0;
end

always @(posedge clk)                                                                                               
begin 
	B = A;
end

endmodule
