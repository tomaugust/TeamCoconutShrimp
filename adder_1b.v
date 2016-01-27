module adder_1b(a, b, cin, sum, cout);
  input a, b, cin;
  output sum, cout;
  wire x, a1, a2;
  
  xor_1b GATE_X1(
	.a (a),
	.b (b),
	.z (x)
  );
  
  xor_1b GATE_X2(
	.a (x),
	.b (cin),
	.z (sum)
  );
  
  and_1b GATE_A1(
	.a (a),
	.b (b),
	.z (a1)
  );
  
  and_1b GATE_A2(
	.a (x),
	.b (cin),
	.z (a2)
  );
  
  and_1b GATE_A3(
	.a (a1),
	.b (a2),
	.z (cout)
  );
  
endmodule