module xor_1b_tb;
  reg A;
  reg B;
  wire Z;
  
  xor_1b XOR_GATE(
	.a (A),
	.b (B),
	.z (Z)
  );
  
  initial begin
	$monitor("A = %b, B = %b, Z = %b", A, B, Z);
	#0 A = 1'b0; B = 1'b0;
	#1 A = 1'b0; B = 1'b1;
	#1 A = 1'b1; B = 1'b0;
	#1 A = 1'b1; B = 1'b1;
  end

endmodule