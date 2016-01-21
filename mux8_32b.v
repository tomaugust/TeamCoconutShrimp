module mux8_32b(a,b,c,d,e,f,g,h,s,z);
    input   [31:0] a,b,c,d,e,f,g,h;
    input   [2:0]s;
    output   [31:0] z;
    wire   [31:0] w1,w2,w3,w4,w5,w6;
    
    mux2_32b m01(a,b,s[0],w1);
    mux2_32b m23(c,d,s[0],w2);
    mux2_32b m45(e,f,s[0],w3);
    mux2_32b m67(g,h,s[0],w4);
    mux2_32b m0123(w1,w2,s[1],w5);
    mux2_32b m4567(w3,w4,s[1],w6);
    mux2_32b m01234567(w5,w6,s[2],z);
endmodule
