module xor_32b(a, b, z);
  input [31:0] a, b;
  output [31:0] z;
  
  genvar i;
  for (i = 0; i < 32; i = i + 1) begin
    xor_1b XOR_i(
	  .a (a[i]),
	  .b (b[i]),
	  .z (z[i])
	);
  end
  
endmodule