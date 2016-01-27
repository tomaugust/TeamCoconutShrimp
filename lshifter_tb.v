module lshifter_tb;
  reg [31:0]   X;
  reg [4:0]    SHAMT;
  wire [31:0]   Z;

  lshifter_32 lshft(.x(X), .shamt(SHAMT), .z(Z));

   initial begin
      $monitor("X = %h SHAMT = %d Z = %h", X, SHAMT, Z);
      #0 X = 32'hab; SHAMT = 0;
      #10 X = 32'hab; SHAMT = 1;
      #10 X = 32'hab; SHAMT = 3;
      #10 X = 32'hab; SHAMT = 6;
      #10 X = 32'h800000ab; SHAMT = 3;
      #10 X = 32'h80000d2c; SHAMT = 8;
      #10 X = 32'h80000d2c; SHAMT = 9;
   end // initial begin

   endmodule
