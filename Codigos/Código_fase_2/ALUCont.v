`timescale 1ns/1ns

module ALUCONTROL (
	input [5:0] Funct,
	input [2:0] ALUOp,
	output reg [2:0] Salida
);

always @*
begin
	case (ALUOp)
		3'b110:
		begin
			Salida = 3'b001;
		end
		3'b100:
		begin
			Salida = 3'b000;
		end
		3'b000:
		begin
			Salida = 3'b010;
		end
		3'b001:
		begin
			Salida = 3'b110;
		end
		3'b111:
		begin
			Salida = 3'b111;
		end
		3'b010:
		begin
			case (Funct)
				6'b000000:
				begin	
					//NOp
					Salida = 3'bxxx;
				end
				6'b100000:
				begin	
					//add
					Salida = 3'b010;
				end
				6'b100010:
				begin
					//sub
					Salida = 3'b110;
				end
				6'b100100:
				begin
					//and
					Salida = 3'b000;
				end
				6'b100101:
				begin
					//or
					Salida = 3'b001;
				end
				6'b101010:
				begin
					//SLT
					Salida = 3'b111;
				end
			endcase
		end
	endcase
end

endmodule
