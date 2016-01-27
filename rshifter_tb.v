module shifter_tb;
  reg [31:0]   X;
  reg [4:0]    SHAMT;
  reg          ARITH;
  wire [31:0]   Z;

  rshifter_32 rshft(.x(X), .shamt(SHAMT), .arith(ARITH), .z(Z));

   initial begin
      $monitor("X = %h SHAMT = %d ARITH = %b Z = %h", X, SHAMT, ARITH, Z);
      #0 X = 32'haa; SHAMT = 0; ARITH = 1'b0;
      #10 X = 32'haa; SHAMT = 3; ARITH = 1'b0;
      #10 X = 32'h1; SHAMT = 1; ARITH = 1'b0;
      #10 X = 32'h1; SHAMT = 1; ARITH = 1'b0;
      #10 X = 32'haa; SHAMT = 0; ARITH = 1'b1;
      #10 X = 32'haa; SHAMT = 3; ARITH = 1'b1;
      #10 X = 32'h1; SHAMT = 0; ARITH = 1'b1;
      #10 X = 32'h1; SHAMT = 1; ARITH = 1'b1;
      #10 X = 32'hd2c; SHAMT = 8; ARITH = 1'b1;
      #10 X = 32'hd2c; SHAMT = 9; ARITH = 1'b1;
      #10 $display("Testing negative values: ");
      #10 X = -32'h1; SHAMT = 1; ARITH = 1'b1;
      #10 X = -32'h2; SHAMT = 1; ARITH = 1'b1;
      #10 X = -32'haa; SHAMT = 3; ARITH = 1'b1;
      #10 X = -32'h1; SHAMT = 0; ARITH = 1'b1;
      #10 X = -32'h2; SHAMT = 0; ARITH = 1'b1;
      #10 X = -32'haa; SHAMT = 3; ARITH = 1'b1;
      #10 X = -32'h2; SHAMT = 1; ARITH = 1'b0;
      #10 X = -32'haa; SHAMT = 3; ARITH = 1'b0;
      #10 X = -32'h2; SHAMT = 1; ARITH = 1'b0;
      #10 X = 32'h80000d2c; SHAMT = 8; ARITH = 1'b1;
      #10 X = 32'h80000d2c; SHAMT = 9; ARITH = 1'b1;
   end // initial begin

   endmodule
