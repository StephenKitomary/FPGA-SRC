/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

module And(a,b,out);
    input a;
	input b;
    output out;

	Nand NAND1(.a(a),.b(b),.out(nand1));
	Not NOT(.in(nand1),.out(out));

endmodule
