/**
 * Not gate:
 * out = not in
 */
module Not(in, out);

	input in;
	output out;
	Nand NAND(.a(in),.b(1'b1),.out(out));

endmodule

