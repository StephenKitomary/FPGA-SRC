/**
 * Computes the sum of three bits.
 */

`default_nettype none
module FullAdder(
	input a,		//1-bit input
	input b,		//1-bit input
	input c,		//1-bit input
	output sum,		//Right bit of a + b + c
	output carry	//Left bit of a + b + c
);

	wire sums, carrys, carryss, throw;
	HalfAdder HalfAdder0(a, b, sums, carrys);
	HalfAdder HalfAdder1(sums, c, sum, carryss);
	HalfAdder HalfAdder2(carrys, carryss, carry, throw);

endmodule
