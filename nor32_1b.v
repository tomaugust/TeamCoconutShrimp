module nor32_1b(a, z);
  input [31:0] a;
  output z;
  
  wire [15:0] t1;
  wire [7:0] t2;
  wire [3:0] t3;
  wire [1:0] t4;
  
  genvar i;
  for (i = 0; i < 32; i = i + 2) begin
	or_1b L1_GATE(
	  .a (a[i]),
	  .b (a[i+1]),
	  .z (t1[i/2])
	);
  end
  
  genvar j;
  for (j = 0; j < 16; j = j + 2) begin
	or_1b L2_GATE(
	  .a (t1[j]),
	  .b (t1[j+1]),
	  .z (t2[j/2])
	);
  end
  
  genvar k;
  for (k = 0; k < 8; k = k + 2) begin
	or_1b L3_GATE(
	  .a (t2[k]),
	  .b (t2[k+1]),
	  .z (t3[k/2])
	);
  end
  
  genvar l;
  for (l = 0; l < 4; l = l + 2) begin
    or_1b L4_GATE(
	  .a (t3[l]),
	  .b (t3[l+1]),
	  .z (t4[l/2])
	);
  end
  
  or_1b L5_GATE(
	.a (t4[0]),
	.b (t4[1]),
	.z (z)
  );
  
endmodule