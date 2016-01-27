/* Comparison decoder
* Takes in ctrl bits, greater and eql signals
* Returns 32 bit 0 or 1 according to comp request
*
* Ctrl designations:
* 000 = set on less than
* 001 = set on less than or equal to
* 010 = set on greater than
* 011 = set on greater than or equal to
* 1X0 = set on equal to
* 1X1 = set on not equal to
*/

module comp_dcd(grtr_in, eql_in, ctrl, z);

input [2:0] 	ctrl;
input 		grtr_in;
input 		eql_in;
output [31:0]	z;

wire [2:0] 	ctrl;
wire 		grtr_in;
wire 		eql_in;
wire [31:0]	z;

wire comp1, comp2, comp3, eq1, sel1;
wire less1, less2, less3, grtr1;

and_1b c1 (.a (ctrl[0]), .b (eql_in), .z (comp1));
//xor_1b c2 (.a (ctrl[1]), .b (grtr_in), .z (comp2));
and_1b c2 (.a (ctrl[1]), .b (grtr_in), .z (grtr1));

or_1b l1 (.a (ctrl[1]), .b (eql_in), .z (less1));
or_1b l2 (.a (less1), .b (grtr_in), .z (less2));
not_1b l3 (.a (less2), .z (less3));

or_1b lc (.a (less3), .b (grtr1), .z (comp2));

or_1b c3 (.a (comp1), .b(comp2), .z (comp3));

xor_1b e1 (.a (ctrl[0]), .b (eql_in), .z (eq1));

mux2_1b m1 (.a (comp3), .b (eq1), .s (ctrl[2]), .z (sel1));

mux2_32b mout (.a (32'h0), .b (32'h1), .s (sel1), .z (z));

endmodule