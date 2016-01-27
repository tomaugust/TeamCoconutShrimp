module comparer_tb;
  reg A, B , RESULT, COUT, ZERO, SIGN, OVERFLOW;
  wire EQL, SLT;
  
  comparer COMP(
    	.a (A),
	.b (B),
	.result (RESULT),
	.cout (COUT),
	.zero (ZERO),
	.sign (SIGN),
	.overflow (OVERFLOW),
	.eql (EQL),
	.slt (SLT)
  );
  
  initial begin
    $monitor("A = %b, B = %b, RESULT = %b, COUT = %b, ZERO = %b, SIGN = %b, , OVERFLOW = %b, EQL = %b, SLT = %b", A, B, RESULT, COUT, ZERO, SIGN, OVERFLOW, EQL, SLT);
	#0 A = 1'b0; B = 1'b0; RESULT = 1'b0; COUT = 1'b0; ZERO = 1'b0; SIGN = 1'b0; OVERFLOW = 1'b0;
	#1 A = 1'b0; B = 1'b0; RESULT = 1'b0; COUT = 1'b1; ZERO = 1'b0; SIGN = 1'b0; OVERFLOW = 1'b0;
	#1 A = 1'b0; B = 1'b0; RESULT = 1'b0; COUT = 1'b1; ZERO = 1'b0; SIGN = 1'b1; OVERFLOW = 1'b0; 
	#1 A = 1'b0; B = 1'b0; RESULT = 1'b0; COUT = 1'b1; ZERO = 1'b0; SIGN = 1'b1; OVERFLOW = 1'b1;
	#1 A = 1'b0; B = 1'b0; RESULT = 1'b1; COUT = 1'b1; ZERO = 1'b0; SIGN = 1'b1; OVERFLOW = 1'b0; 
	#1 A = 1'b0; B = 1'b0; RESULT = 1'b1; COUT = 1'b1; ZERO = 1'b0; SIGN = 1'b1; OVERFLOW = 1'b1; 
  end
  
endmodule