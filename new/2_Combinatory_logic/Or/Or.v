 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

module Or(a,b,out);
    input a;
   	input b;
    output out;

   	Not NOT1(.in(a),.out(na));
	Not NOT2(.in(b),.out(nb));
	Nand NAND1(.a(na),.b(nb),.out(out));

endmodule
