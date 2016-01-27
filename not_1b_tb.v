module not_1b_tb;
  reg A;
  wire Z;
  
  not_1b NOT_GATE(
	.a (A),
	.z (Z)
  );
  
  initial begin
	$monitor("A = %b, Z = %b", A, Z);
	#0 A = 1'b0;
	#1 A = 1'b1;
  end

endmodule