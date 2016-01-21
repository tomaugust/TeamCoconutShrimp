module mux2_1b(a,b,s,z);
    input   a,b,s;
    output   z;
    
    assign z = s ? b:a; //if s=1, z=b, else z=a
endmodule
