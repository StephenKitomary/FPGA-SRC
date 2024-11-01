/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

`default_nettype none
module Xor(
	input a,
	input b,
	output out
);

wire n_a, n_b, n_a_b, n_b_a;

Not not_a(a, n_a);
Not not_b(b, n_b);
And and_n_a_b(n_a, b, n_a_b);
And and_n_b_a(a, n_b, n_b_a);
Or or_o(n_a_b, n_b_a, out);

endmodule
