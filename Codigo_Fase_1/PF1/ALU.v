`timescale 1ns/1ns

module ALU (
	input [31:0]INOP1,
	input [31:0]INOP2,
	input [2:0]S_OP,
	output reg [31:0]RES_OP,
	output reg ZEROFLAG
);
always @*
begin
	case (S_OP)
		//NOp
		3'b000:
		begin
			RES_OP = 32'd0;
		end
		//add
		3'b010:
		begin
			RES_OP = INOP1 + INOP2;
		end
		//sub
		3'b110:
		begin
			RES_OP = INOP1 - INOP2;
		end
		/*8'b00100000:
		begin
			RES_OP = INOP1 * INOP2;
		end
		8'b00010000:
		begin
			RES_OP = INOP1/INOP2;
		end*/
		//and
		3'b000:
		begin
			RES_OP = INOP1 & INOP2;
		end
		//or
		3'b001:
		begin
			RES_OP = INOP1 | INOP2;
		end
		//SLT
		3'b111:
		begin
			RES_OP <= (INOP1<INOP2) ? 1:0;
			ZEROFLAG <= (RES_OP)?0:1;
		end
	endcase
	if (RES_OP == 32'd0)begin
		ZEROFLAG = 1;
	end
	else begin
		ZEROFLAG = 0;
	end
end

endmodule
