module shifter_tb;
  reg [31:0]   X;
  reg          SHAMT;
  reg          ARITH;
  wire [31:0]   Z;

  shifter_32 rshft(.x(X), .shamt(SHAMT), .arith(ARITH), .z(Z));

   initial begin
      $monitor("X = %h SHAMT = %b ARITH = %b Z = %h", X, SHAMT, ARITH, Z);
      #0 X = 32'ha; SHAMT = 1'b0; ARITH = 1'b0;
      #5 X = 32'ha; SHAMT = 1'b1; ARITH = 1'b0;
      #5 X = 32'h1; SHAMT = 1'b0; ARITH = 1'b0;
      #5 X = 32'h1; SHAMT = 1'b1; ARITH = 1'b0;
      #5 X = 32'h0; SHAMT = 1'b0; ARITH = 1'b0;
      #5 X = 32'h0; SHAMT = 1'b1; ARITH = 1'b0;
      #5 X = 32'ha; SHAMT = 1'b0; ARITH = 1'b1;
      #5 X = 32'ha; SHAMT = 1'b1; ARITH = 1'b1;
      #5 X = 32'h1; SHAMT = 1'b0; ARITH = 1'b1;
      #5 X = 32'h1; SHAMT = 1'b1; ARITH = 1'b1;
      #5 X = 32'h0; SHAMT = 1'b0; ARITH = 1'b1;
      #5 X = 32'h0; SHAMT = 1'b1; ARITH = 1'b1;
   end // initial begin

   endmodule
