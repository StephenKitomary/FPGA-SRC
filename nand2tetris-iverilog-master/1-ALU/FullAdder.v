/**
 * Computes the sum of three bits.
 */
`default_nettype none

module FullAdder(
    input wire a,       //1-bit input
    input wire b,       //1-bit input
    input wire c,       //1-bit input
    output wire sum,    //Right bit of a + b + c
    output wire carry   //Left bit of a + b + c
);


wire sums, carrys, carryss, throw;

HalfAdder HalfAdder0(a, b, sums, carrys);
HalfAdder HalfAdder1(sums, c, sum, carryss);
HalfAdder HalfAdder2(carrys, carryss, carry, throw);

endmodule
