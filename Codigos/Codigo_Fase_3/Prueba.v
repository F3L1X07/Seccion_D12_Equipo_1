/*`timescale 1ns/1ns

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

endmodule*/

`timescale 1ns/1ns

module PF3(
	input CLK
);

//PC cables
wire [31:0]PCToInstM;
//Mux4 cables
wire [31:0]Mux4ToPC;
//Adder1 cables
wire [31:0]Add1ToMux4;
//InstMEMO cables
wire [31:0]Instruction;
//Buffer1 cables
wire [31:0]Add1ToBuf2;
wire [31:0]Inst;
//Unidad de control cables
wire RegWSal;
wire MemToReg;
wire Branch;
wire MemRead;
wire MemToWrite;
wire RegDst;
wire [2:0]ALUOpSal;
wire ALUSrc;
wire jumpTobuf2;
//Banco de registros cables
wire [31:0]DR1Sal;
wire [31:0]DR2Sal;
//Sign Extender cables
wire [31:0]SignSal;
//Buffer2 cables
wire [1:0]WBToBuf3;
wire [2:0]MToBuf3;
wire RegDstToMux1;
wire [2:0]ALUOpToALUC;
wire ALUSrcToMux2;
wire [31:0]AToAdd2;
wire [31:0]BToALUOp1;
wire [31:0]CToMux2;
wire [31:0]DToMux2;
wire [4:0]EToMux1;
wire [4:0]FToMux1;
wire [31:0]shift_2tobuf3;
wire jumpTobuf3;
//Shift cables
wire [31:0]ShiftSal;
//ALU cables
wire [31:0]ALURToBuf3;
wire ZFToBuf3;
//Adder2 cables
wire [31:0]Add2ToBuf3;
//Mux2 cables
wire [31:0]Mux2ToALU;
//Mux1 cables
wire [4:0]Mux1ToBuf3;
//ALUCONTROL cables
wire [2:0]ALUCToALU;
//Buffer3 cables
wire [1:0]WBToBuf4;
wire BToAND;
wire MRToDataM;
wire MWToDataM;
wire [31:0]AToMux4;
wire ZFToAND;
wire [31:0]CToAddress;
wire [31:0]DToDataM;
wire [4:0]EToBuf4;
wire [31:0]Buf3ToMux4;
wire [31:0]shiftToMux5;
wire jumpToMux5;
//AND
wire ANDToMux4;
//Data Mem 
wire [31:0]DoutToBuf4;
//Buffer4 cables
wire RegWToBR;
wire MTRToMux3;
wire [31:0]AToMux3;
wire [31:0]BToMux3;
wire [4:0]CToDir;
//Mux3 cables
wire [31:0]Mux3ToDin;
//Shift_2 cables
wire [27:0]shift_2tobuf2;
//Mux5 cables
wire [31:0]Mux5ToPC;

PC PCPr(
	.clk(CLK),
	.A(Mux5ToPC),
	.B(PCToInstM)
);

Mux4 Mux4Pr(
	.A(Buf3ToMux4),
	.B(AToMux4),
	.S(ANDToMux4),
	.Sal(Mux4ToPC)
);

Mux5 Mux5F3(
	.A(shiftToMux5),
	.B(Mux4ToPC),
	.S(jumpToMux5),
	.Sal(Mux5ToPC)
);

Adder1 Add1Pr(
	.A(PCToInstM),
	.C(Add1ToMux4)
);

InstMEMO InstMEMOPr(
	.Dir(PCToInstM),
	.Dout(Instruction)
);

Buf1 Buf1Pr(
	.clk(CLK),
	.A(Add1ToMux4),
	.B(Instruction),
	.C(Add1ToBuf2),
	.D(Inst)
);

shift_2 shift_2f3(
	.A(Inst[25:0]),
	.B(shift_2tobuf2)
);

UC UCPr(
	.OpCode(Inst[31:26]),
	.RegWrite(RegWSal),
	.MemToReg(MTRSal),
	.Branch(BranchSal),
	.MemRead(MemRSal),
	.MemToWrite(MTWSal),
	.RegDst(RegDSal),
	.ALUOp(ALUOpSal),
	.ALUSrc(ALUSrcSal),
	.jump(jumpTobuf2)
);

BR BRPr(
	.RegW(RegWToBR),
	.RA1(Inst[25:21]),
	.RA2(Inst[20:16]),
	.Dir(CToDir),
	.Din(Mux3ToDin),
	.DR1(DR1Sal),
	.DR2(DR2Sal)
);

SignEx SignExPr(
	.A(Inst[15:0]),
	.B(SignSal)
);

Buf2 Buf2Pr(
	.clk(CLK),
	.WB({RegWSal, MTRSal}),
	.M({BranchSal, MemRSal, MTWSal}),
	.EX({RegDSal, ALUOpSal, ALUSrcSal}),
	.A(Add1ToBuf2),
	.B(DR1Sal),
	.C(DR2Sal),
	.D(SignSal),
	.E(Inst[20:16]),
	.F(Inst[15:11]),
	.WBSal(WBToBuf3),
	.MSal(MToBuf3),
	.RegDst(RegDstToMux1),
	.ALUOp(ALUOpToALUC),
	.ALUSrc(ALUSrcToMux2),
	.ASal(AToAdd2),
	.BSal(BToALUOp1),
	.CSal(CToMux2),
	.DSal(DToMux2),
	.ESal(EToMux1),
	.FSal(FToMux1),
	.shift_2(shift_2tobuf2),
	.Shift_2Sal(shift_2tobuf3),
	.jump(jumpTobuf2),
	.jumpsal(jumpTobuf3)
);

Adder2 Add2Pr(
	.A(AToAdd2),
	.B(ShiftSal),
	.C(Add2ToBuf3)
);

shift ShiftPr(
	.A(DToMux2),
	.B(ShiftSal)
);

ALU ALUPr(
	.INOP1(BToALUOp1),
	.INOP2(Mux2ToALU),
	.S_OP(ALUCToALU),
	.RES_OP(ALURToBuf3),
	.ZEROFLAG(ZFToBuf3)
);

Mux2 Mux2Pr(
	.A(CToMux2),
	.B(DToMux2),
	.S(ALUSrcToMux2),
	.Sal(Mux2ToALU)
);

Mux1 Mux1Pr(
	.A(EToMux1),
	.B(FToMux1),
	.S(RegDstToMux1),
	.Sal(Mux1ToBuf3)
);

ALUCONTROL ALUCPr(
	.Funct(DToMux2[5:0]),
	.ALUOp(ALUOpToALUC),
	.Salida(ALUCToALU)
);

Buf3 Buf3Pr(
	.clk(CLK),
	.WB(WBToBuf3),
	.M(MToBuf3),
	.A(Add2ToBuf3),
	.B(ZFToBuf3),
	.C(ALURToBuf3),
	.D(CToMux2),
	.E(Mux1ToBuf3),
	.Add1(AToAdd2),
	.WBSal(WBToBuf4),
	.BranchSal(BToAND),
	.MemRSal(MRToDataM),
	.MemWSal(MWToDataM),
	.ASal(AToMux4),
	.BSal(ZFToAND),
	.CSal(CToAddress),
	.DSal(DToDataM),
	.ESal(EToBuf4),
	.Buf3ToMux4(Buf3ToMux4),
	.shift_2(shift_2tobuf3),
	.shift_sal(shiftToMux5),
	.jump(jumpTobuf3),
	.jumpsal(jumpToMux5)
);

CAND CANDPr(
	.A(BToAND),
	.B(ZFToAND),
	.C(ANDToMux4)
);

MEMO MEMOPr(
	.Ew(MWToDataM),
	.Er(MRToDataM),
	.Dir(CToAddress[4:0]),
	.Din(DToDataM),
	.Dout(DoutToBuf4)
);

Buf4 Buf4Pr(
	.clk(CLK),
	.WB(WBToBuf4),
	.A(DoutToBuf4),
	.B(CToAddress),
	.C(EToBuf4),
	.RegW(RegWToBR),
	.MemToReg(MTRToMux3),
	.Asal(AToMux3),
	.BSal(BToMux3),
	.Csal(CToDir)
);

Mux3 Mux3Pr(
	.A(AToMux3),
	.B(BToMux3),
	.S(MTRToMux3),
	.Sal(Mux3ToDin)
);

endmodule	
