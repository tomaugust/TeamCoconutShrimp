module mux2_32b_tb;
    reg [31:0] A;
    reg [31:0] B;
    reg SEL;
    wire [31:0] Z;
    
    mux2_32b MUX2_32B(.a(A),.b(B),.s(SEL),.z(Z));
    
    initial begin
        $monitor("A=%h B=%h SEL=%b Z=%h",A,B,SEL,Z);
        #0 A=32'h00000000; B=32'h11111111; SEL=1'b0;
        #1 A=32'h22222222; B=32'h12345678; SEL=1'b0;
        #1 A=32'hffffffff; B=32'heeeeeeee; SEL=1'b1;
        #1 A=32'h00001111; B=32'h99998765; SEL=1'b1;
        #1 A=32'h45456767; B=32'h11111111; SEL=1'b1;
    end
endmodule
