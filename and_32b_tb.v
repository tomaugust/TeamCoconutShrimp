module and_32b_tb;
  reg [31:0] A, B;
  wire [31:0] Z;
  
  and_32b AND_GATE(
	.a (A),
	.b (B),
	.z (Z)
  );
  
  initial begin
	$monitor("A = %h, B = %h, Z = %h", A, B, Z);
	#0 A = 32'h00000000; B = 32'h00000000;
	#1 A = 32'h11111111; B = 32'h00000000;
	#1 A = 32'hffffffff; B = 32'h00000000;
	#1 A = 32'h00000000; B = 32'h11111111;
	#1 A = 32'h11111111; B = 32'h11111111;
	#1 A = 32'hffffffff; B = 32'h11111111;
	#1 A = 32'h00000000; B = 32'hffffffff;
	#1 A = 32'h11111111; B = 32'hffffffff;
	#1 A = 32'hffffffff; B = 32'hffffffff;
  end
  
endmodule