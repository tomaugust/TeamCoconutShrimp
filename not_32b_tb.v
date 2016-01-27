module not_32b_tb;
  reg [31:0] A;
  wire [31:0] Z;
  
  not_32b INV_GATE(
	.a (A),
	.z (Z)
  );
  
  initial begin
    $monitor("A = %h, Z = %h", A, Z);
	#0 A = 32'h00000000;
	#1 A = 32'h00000001;
	#1 A = 32'hffffffff;
	#1 A = 32'h00000002;
	#1 A = 32'h00000004;
	#1 A = 32'h00000008;
	#1 A = 32'h00000010;
	#1 A = 32'h00000200;
	#1 A = 32'h00004000;
	#1 A = 32'h00080000;
	#1 A = 32'h00100000;
	#1 A = 32'h02000000;
	#1 A = 32'h40000000;
	#1 A = 32'h80000000;
  end
  
endmodule