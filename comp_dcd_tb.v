module comp_dcd_tb;
  reg 		grtr_in;
  reg 		eql_in;
  reg [2:0] 	ctrl;
  wire [31:0]	z;

  comp_dcd cd(.grtr_in(grtr_in), .eql_in(eql_in), .ctrl(ctrl), .z(z));

   initial begin
      $display("These tests should pass (Z = 1)");
      $monitor("CTRL = %b GRTR = %b EQL = %b Z = %d", ctrl, grtr_in, eql_in, z);  
      #0 ctrl = 3'b000; grtr_in = 0; eql_in = 0;   // less than
      #10 ctrl = 3'b001; grtr_in = 0; eql_in = 1;  // less than or equal
      #10 ctrl = 3'b010; grtr_in = 1; eql_in = 0;   // greater than
      #10 ctrl = 3'b011; grtr_in = 1; eql_in = 1;  // greater than or equal
      #10 ctrl = 3'b100; grtr_in = 0; eql_in = 1;   // equal
      #10 ctrl = 3'b101; grtr_in = 1; eql_in = 0;   // not equal
      $display("These tests should fail (Z = 0)");
      #0 ctrl = 3'b000; grtr_in = 0; eql_in = 1;   // less than
      #10 ctrl = 3'b001; grtr_in = 1; eql_in = 0;  // less than or equal
      #10 ctrl = 3'b010; grtr_in = 0; eql_in = 1;   // greater than
      #10 ctrl = 3'b011; grtr_in = 0; eql_in = 0;  // greater than or equal
      #10 ctrl = 3'b100; grtr_in = 0; eql_in = 0;   // equal
      #10 ctrl = 3'b101; grtr_in = 0; eql_in = 1;   // not equal
   end // initial begin

   endmodule
