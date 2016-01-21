//  one-bit right shifter
// shifts 32b input right by 1 or 0 bits according to shamt

module shifter_32(x, shamt, arith, z);

input [31:0] x;
input shamt;
input arith;         // indicates this is arithmetic shift
output [31:0] z;

wire [31:0]   x;
wire          shamt;
wire          arith;
wire [31:0]   z;

genvar i;

mux2_1b msb (
.a      (x[31]),
.b      (arith),
.s      (shamt),
.z      (z[31])
);


// 31 times: (i = 0 to 30)
for (i=0; i<=30; i=i+1) begin
mux2_1b l1 (
.a       (x[i]),
.b       (x[i+1]),
.s       (shamt),
.z       (z[i])
);
end

endmodule
