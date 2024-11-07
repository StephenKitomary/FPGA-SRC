/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

module DMux(in,sel,a,b);
	input in;
	input sel;
   	output a;
   	output b;

	Not notsel(.in(sel),.out(nsel));
	And anda(.a(in),.b(nsel),.out(a));
	And andb(.a(in),.b(sel),.out(b));
endmodule
