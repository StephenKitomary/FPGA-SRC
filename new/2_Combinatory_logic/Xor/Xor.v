/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

module Xor(a,b,out);
    input a;
	input b;
    output out;

	Nand NAND1(.a(a),.b(b),.out(nand1));
	Nand NAND2(.a(a),.b(nand1),.out(nand2));
	Nand NAND3(.a(nand1),.b(b),.out(nand3));
	Nand NAND4(.a(nand2),.b(nand3),.out(out));

endmodule
