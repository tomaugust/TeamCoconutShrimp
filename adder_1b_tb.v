module adder_1b_tb;
  reg A;
  reg B;
  reg CIN;
  wire SUM;
  wire COUT;
  
  adder_1b ADDER(
    .a (A),
	.b (B),
	.cin (CIN),
	.sum (SUM),
	.cout (COUT)
  );
  
  initial begin
    $monitor("A = %b, B = %b, CIN = %b, SUM = %b, COUT = %b", A, B, CIN, SUM, COUT);
	#0 A = 1'b0; B = 1'b0; CIN = 1'b0;
	#1 A = 1'b0; B = 1'b0; CIN = 1'b1;
	#1 A = 1'b0; B = 1'b1; CIN = 1'b0;
	#1 A = 1'b0; B = 1'b1; CIN = 1'b1;
	#1 A = 1'b1; B = 1'b0; CIN = 1'b0;
	#1 A = 1'b1; B = 1'b0; CIN = 1'b1;
	#1 A = 1'b1; B = 1'b1; CIN = 1'b0;
	#1 A = 1'b1; B = 1'b1; CIN = 1'b1;
  end
  
endmodule