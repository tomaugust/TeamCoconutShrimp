module mux2_1b(a,b,s,z);
    input   a,b,s;
    output   z;
	wire   n,a1,a2;
	
	//if s=1, z=b, else z=a
	not_1b GATE_N(
		.a (s),
		.z (n)
	);
	
	and_1b GATE_A1(
		.a (a),
		.b (n),
		.z (a1)
	);
	
	and_1b GATE_A2(
		.a (b),
		.b (s),
		.z (a2)
	);
	
	or_1b GATE_O(
		.a (a1),
		.b (a2),
		.z (z)
	);
    
    //assign z = s ? b:a;
endmodule
