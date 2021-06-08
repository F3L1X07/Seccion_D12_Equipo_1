`timescale 1ns/1ns

module PF1(
	input CLK
);

wire [31:0]PCCA; //Program Counter In A
wire [31:0]PCCB; //Program Counter In B
//Adder Respuesta
wire [31:0]AddCR;
wire [31:0]Add2CRes;
wire [31:0]Instruction; //Memoria de instrucciones salida
//Mux  Salidas
wire [4:0]Mux1CSal;
wire [31:0]Mux2CSal;
wire [31:0]Mux3CSal;
//Unidad de control wires
wire UCCRDst;
wire UCCBranch;
wire UCCMemRead;
wire UCCMTR;
wire [2:0]UCCALUOp;
wire UCCMTW;
wire UCCALUSrc;
wire UCCRW;
//CAND wires
wire CANDCC;
//Banco de registros wires
wire [31:0]BRCDR1;
wire [31:0]BRCDR2;
//Sign extender wires
wire [31:0]SignExCB;
//ALU Control wires
wire [2:0]ALUCCSal;
//ALU
wire [31:0]ALUCRes;
wire ALUCZF;
//Shift
wire [31:0]shiftCSal;
//Data Memory
wire [31:0]DMCDout;

CAND CANDPF1(
	.A(UCCBranch),
	.B(ALUCZF),
	.C(CANDCC)
);

shift shiftPF1(
	.A(SignExCB),
	.B(shiftCSal)
);

Mux1 Mux1PF1(
	.A(Instruction[20:16]),
	.B(Instruction[15:11]),
	.S(UCCRDst),
	.Sal(Mux1CSal)
);

Mux2 Mux2PF1(
	.A(BRCDR2),
	.B(SignExCB),
	.S(UCCALUSrc),
	.Sal(Mux2CSal)
);

Mux3 Mux3PF1(
	.A(DMCDout),
	.B(ALUCRes),
	.S(UCCMTR),
	.Sal(Mux3CSal)
);

Mux4 Mux4PF1(
	.A(AddCR),
	.B(Add2CRes),
	.S(CANDCC),
	.Sal(PCCA)
);

ALU ALUPF1(
	.INOP1(BRCDR1),
	.INOP2(Mux2CSal),
	.S_OP(ALUCCSal),
	.RES_OP(ALUCRes),
	.ZEROFLAG(ALUCZF)
);

MEMO MEMOPF1(
	.Ew(UCCMTW),
	.Er(UCCMemRead),
	.Dir(ALUCRes[4:0]),
	.Din(BRCDR2),
	.Dout(DMCDout)
);

Adder1 AddPF1(
	.A(PCCB),
	.C(AddCR)
);

Adder2 Add2PF1(
	.A(AddCR),
	.B(shiftCSal),
	.C(Add2CRes)
);

PC PCPF1(
	.clk(CLK),
	.A(PCCA),
	.B(PCCB)
);

InstMEMO InMPF1(
	.Dir(PCCB),
	.Dout(Instruction)
);

UC UCPF1(
	.OpCode(Instruction[31:26]),
	.RegDst(UCCRDst),
	.Branch(UCCBranch),
	.MemRead(UCCMemRead),
	.MemToReg(UCCMTR),
	.ALUOp(UCCALUOp),
	.MemToWrite(UCCMTW),
	.ALUSrc(UCCALUSrc),
	.RegWrite(UCCRW)
);

BR BRPF1(
	.RA1(Instruction[25:21]),
	.RA2(Instruction[20:16]),
	.Dir(Mux1CSal),
	.RegW(UCCRW),
	.Din(Mux3CSal),
	.DR1(BRCDR1),
	.DR2(BRCDR2)
);

SignEx SignExPF1(
	.A(Instruction[15:0]),
	.B(SignExCB)
);

ALUCONTROL ALUCPF1(
	.Funct(Instruction[5:0]),
	.ALUOp(UCCALUOp),
	.Salida(ALUCCSal)
);

endmodule
