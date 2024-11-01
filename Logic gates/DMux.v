/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

`default_nettype none
module DMux(
    input wire in,
    input wire sel,
    output wire a,
    output wire b
);

    // Internal wire for the negated selection signal
    wire not_sel;

    // Invert the select signal
    Not not_1(sel, not_sel);

    // Output logic
    And and_1(in, not_sel, a); // a = in when sel == 0
    And and_2(in, sel, b);     // b = in when sel == 1

endmodule

