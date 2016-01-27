module ALU_tb;
  reg [31:0] A, B;
  reg [2:0] ALUSEL;
  reg ADDSEL, ARITHSEL, LT, GT, EQ;
  wire [31:0] Z;
  wire OVERFLOW, ZERO;
  
  ALU TEST_ALU(
	.a (A),
	.b (B),
	.AddSel (ADDSEL),
	.ArithSel (ARITHSEL),
	.ALUSel (ALUSEL),
	.lt (LT),
	.gt (GT),
	.eq (EQ),
	.z (Z),
	.overflow (OVERFLOW),
	.zero (ZERO)
  );