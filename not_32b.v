module not_32b(a, z);
  input [31:0] a;
  output [31:0] z;
  
  genvar i;
  for (i = 0; i < 32; i = i + 1) begin
	not_1b INV_GATE(
	  .a (a[i]),
	  .z (z[i])
	);
  end

endmodule