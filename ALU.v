module ALU(a, b, AddSel, ArithSel, ALUSel, CompSel, sign, z, overflow, zero, cflag);
  input [31:0] a, b;
  input [2:0] ALUSel, CompSel;
  input AddSel, ArithSel, sign;
  output [31:0] z;
  output overflow, zero, cflag;
  
  wire [31:0] InvB, MuxB, AddBus, AndBus, OrBus, XorBus, LShiftBus, RShiftBus, CompBus;
  wire cout, ZeroSig, EqlSig, SltSig, temp1, temp2, temp3;
  
  
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
  //Flag Logic
  xor_1b CARRY(
	.a (AddSel),
	.b (cout),
	.z (cflag)
  );

  xor_1b L1(
	.a (a[31]),
	.b(AddBus[31]),
	.z(temp1)
  );

  xor_1b L2(
	.a(a[31]),
	.b(MuxB[31]),
	.z(temp2)
  );

  not_1b INVL2(
	.a(temp2),
	.z(temp3)
  );
  
  and_1b ANDGATE(
	.a(temp1),
	.b(temp3),
	.z(overflow)
  );

  // Comparison Logic ///////////////
  // INSERT COMPARISON BLOCK
  nor32_1b ZERO_NOR(
	.a (AddBus),
	.z (zero)
  );

  comparer COMP(
	.a (a[31]),
	.b (b[31]),
	.result (AddBus[31]),
	.cout (cout),
	.zero (zero),
	.sign (sign),
	.overflow (overflow),
	.eql (EqlSig),
	.slt (SltSig)
  );
  
  comp_dcd DECODE(
	.ctrl (CompSel),
	.less_in(SltSig),
	.eql_in(EqlSig),
	.z(CompBus)
  );

  // Output Select Logic ///////////////
  mux8_32b ALU_OUT(
	.a (AddBus),
	.b (OrBus),
	.c (AndBus),
	.d (XorBus),
	.e (LShiftBus),
	.f (RShiftBus),
	.g (CompBus),
	.h (),
	.s (ALUSel),
	.z (z)
  );

endmodule