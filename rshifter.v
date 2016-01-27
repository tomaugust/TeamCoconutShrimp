// 32-bit right shifter
// shifts 32b input right shamt bits

module rshifter_32(x, shamt, arith, z);
parameter shft_len = 5;
input [31:0] 		x;
input [shft_len-1:0] 	shamt;
input 			arith;       // set if arithmetic shift
output [31:0] 		z;

wire [31:0]   		x;
wire [shft_len-1:0]     shamt;
wire          		arith;
wire [31:0]   		z;

wire [31:0] layer [shft_len:0];

assign layer[0]=x;
assign z=layer[shft_len];

genvar i, j, k;

for (i=0; i<shft_len; i=i+1) begin
  // Top bits
  for (j=32-(1<<i); j<=31; j=j+1) begin
     mux2_1b topbits (
    .a      (layer[i][j]),
    .b      (arith&x[31]),
    .s      (shamt[i]),
    .z      (layer[i+1][j])
  );
  end
  // Rest of the bits
  for (k=0; k<=31-(1<<i); k=k+1) begin
    mux2_1b botbits (
    .a       (layer[i][k]),
    .b       (layer[i][k+(1<<i)]),
    .s       (shamt[i]),
    .z       (layer[i+1][k])
    );
  end
end

endmodule