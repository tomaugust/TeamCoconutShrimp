module mux2_1b_tb;
    reg A;
    reg B;
    reg SEL;
    wire Z;
    
    mux2_1b MUX2_1B(.a(A),.b(B),.s(SEL),.z(Z));
    
    initial begin
        $monitor("A=%b B=%b SEL=%b Z=%b",A,B,SEL,Z);
        #0 A=1'b0; B=1'b0; SEL=1'b0;
        #1 A=1'b1; B=1'b0; SEL=1'b0;
        #1 A=1'b0; B=1'b0; SEL=1'b1;
        #1 A=1'b1; B=1'b0; SEL=1'b1;
        #1 A=1'b0; B=1'b1; SEL=1'b1;
    end
endmodule
