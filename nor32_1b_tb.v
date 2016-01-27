module nor32_1b_tb;
  reg [31:0] A;
  wire Z;
  
  nor32_1b NOR32(
	.a (A),
	.z (Z)
  );
  
  initial begin
    $monitor("A = %h, Z = %b", A, Z);
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