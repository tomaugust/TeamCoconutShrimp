module comparer(a, b, result, cout, zero, sign, overflow, eql , slt);
  input a, b, result, cout, zero, sign, overflow;
  output eql, slt;
  
  wire slts, sltu;

  assign eql = zero;

  //slt
  xor_1b setless(
        .a (overflow),
	.b (result),
	.z (slts)
  );

  //sltu
  not_1b setlessu(
        .a (cout),
	.z (sltu)
  );

  mux2_1b sltres(
		.a (sltu),
		.b (slts),
		.s (sign),
		.z (slt)
	);
 
endmodule