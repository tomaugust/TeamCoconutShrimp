module comp_dcd_tb;
  reg 		less_in;
  reg 		eql_in;
  reg [2:0] 	ctrl;
  wire [31:0]	z;

  comp_dcd cd(.less_in(less_in), .eql_in(eql_in), .ctrl(ctrl), .z(z));

   initial begin
      $display("These tests should pass (Z = 1)");
      $monitor("CTRL = %b LESS = %b EQL = %b Z = %d", ctrl, less_in, eql_in, z);  
      #0 ctrl = 3'b000; less_in = 0; eql_in = 0;   // greater than
      #10 ctrl = 3'b001; less_in = 0; eql_in = 1;  // greater than or equal
      #10 ctrl = 3'b010; less_in = 1; eql_in = 0;   // less than
      #10 ctrl = 3'b011; less_in = 1; eql_in = 1;  // less than or equal
      #10 ctrl = 3'b100; less_in = 0; eql_in = 1;   // equal
      #10 ctrl = 3'b101; less_in = 1; eql_in = 0;   // not equal
      $display("These tests should fail (Z = 0)");
      #0 ctrl = 3'b000; less_in = 0; eql_in = 1;   // greater than
      #10 ctrl = 3'b001; less_in = 1; eql_in = 0;  // greater than or equal
      #10 ctrl = 3'b010; less_in = 0; eql_in = 1;   // less than
      #10 ctrl = 3'b011; less_in = 0; eql_in = 0;  // less than or equal
      #10 ctrl = 3'b100; less_in = 0; eql_in = 0;   // equal
      #10 ctrl = 3'b101; less_in = 0; eql_in = 1;   // not equal
   end // initial begin

   endmodule
