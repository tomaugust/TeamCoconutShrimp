module ALU(a, b, AddSel, ArithSel, ALUSel, lt, gt, eq, sign, z, overflow, zero);
  input [31:0] a, b;
  input [2:0] ALUSel;
  input AddSel, ArithSel, lt, gt, eq, sign;
  output [31:0] z;
  output overflow, zero;
  
  wire [31:0] InvB, MuxB, AddBus, AndBus, OrBus, XorBus, LShiftBus, RShiftBus, CompBus;
  wire cout;
  
  
  // Add/Sub Logic ///////////////
  // MISSING OVERFLOW LOGIC
  not_32b INV_B(
	.a (b),
	.z (InvB)
  );
  
  // if AddSel = 0, +B
  // if AddSel = 1, -B
  mux2_32b B_MUX(
	.a (b),
	.b (InvB),
	.s (AddSel),
	.z (MuxB)
  );
  
  adder_32b ALU_ADD(
	.a (a),
	.b (MuxB),
	.cin (AddSel),
	.sum (AddBus),
	.cout (cout)
  );
  
  
  // Bitwise Logic ///////////////
  and_32b AND_GATE(
	.a (a),
	.b (b),
	.z (AndBus)
  );
  
  or_32b OR_GATE(
	.a (a),
	.b (b),
	.z (OrBus)
  );
  
  xor_32b XOR_GATE(
	.a (a),
	.b (b),
	.z (XorBus)
  );
  
  
  // Shift Logic ///////////////
  lshifter_32 LSHIFT(
	.x (a),
	.shamt (b[4:0]),
	.z (LShiftBus)
  );
  
  // ArithSel = 0 for logical shift
  // ArithSel = 1 for arithmetic shift
  rshifter_32 RSHIFT(
	.x (a),
	.shamt (b[4:0]),
	.arith (ArithSel),
	.z (RShiftBus)
  );
  
  
  // Comparison Logic ///////////////
  // INSERT COMPARISON BLOCK
  comparer COMP(
	.a (a[31]),
	.b (b[31]),
	.result (AddBus[31]),
	.cout (cout),
	.zero (zero),
	.sign (sign),
	.overflow (overflow),
	.eql ,
	.slt ,
  );
  
  nor32_1b ZERO_NOR(
	.a (AddBus),
	.z (zero)
  );
  
  
  // Output Select Logic ///////////////
  mux8_32b ALU_OUT(
	.a (AddBus),
	.b (OrBus),
	.c (AndBus),
	.d (XorBus),
	.e (LShiftBus),
	.f (RShiftBus),
	.g ,
	.h ,
	.s (ALUSel),
	.z (z)
  );