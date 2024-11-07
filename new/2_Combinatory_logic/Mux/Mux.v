/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

module Mux(a,b,sel,out);
	input a;
   	input b;
   	input sel;
   	output out;

	Not NOT(.in(sel),.out(nsel));
	And AND1(.a(a),.b(nsel),.out(sa));
	And AND2(.a(b),.b(sel),.out(sb));
	Or OR(.a(sa),.b(sb),.out(out));

endmodule
