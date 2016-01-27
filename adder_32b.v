module adder_32b(a, b, cin, sum, cout);
  input [31:0] a;
  input [31:0] b;
  input cin;
  output [31:0] sum;
  output cout;
  
  wire [30:0] carry;
  
  adder_1b add_0(
        .a (a[0]),
	.b (b[0]),
	.cin (cin),
	.sum (sum[0]),
	.cout (carry[0])
  );

  genvar i;  
  for (i = 0; i < 30; i = i + 1) begin
    adder_1b add_n(
	  .a (a[i+1]),
	  .b (b[i+1]),
	  .cin (carry[i]),
	  .sum (sum[i+1]),
	  .cout (carry[i+1])
    );
  end
  
  adder_1b add_31(
        .a (a[31]),
	.b (b[31]),
	.cin (carry[30]),
	.sum (sum[31]),
	.cout (cout)
  );

endmodule