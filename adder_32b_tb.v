module adder_32b_tb;
  reg [31:0] A;
  reg [31:0] B;
  reg CIN;
  wire [31:0] SUM;
  wire COUT;
  
  adder_32b ADDER(
        .a (A),
	.b (B),
	.cin (CIN),
	.sum (SUM),
	.cout (COUT)
  );
  
  initial begin
    $monitor("A = %h, B = %h, CIN = %b, SUM = %h, COUT = %b", A, B, CIN, SUM, COUT);
	#0 A = 32'h00000000; B = 32'h00000000; CIN = 1'b0;
	#1 A = 32'h00000001; B = 32'h00000001; CIN = 1'b0;
	#1 A = 32'h00000001; B = 32'h00000000; CIN = 1'b1;
	#1 A = 32'h00000000; B = 32'h00000001; CIN = 1'b1;
	#1 A = 32'h00000001; B = 32'h00000001; CIN = 1'b1;
	#1 A = 32'h000000fe; B = 32'h00000001; CIN = 1'b0;
	#1 A = 32'h000000fe; B = 32'h00000001; CIN = 1'b1;
	#1 A = 32'hfffffffe; B = 32'h00000001; CIN = 1'b0;
	#1 A = 32'hffffffff; B = 32'h00000001; CIN = 1'b0;
	#1 A = 32'hfffffffe; B = 32'h00000001; CIN = 1'b1;
  end
  
endmodule