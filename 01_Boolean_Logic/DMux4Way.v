/**
 * 1-bit 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

`default_nettype none

module DMux4Way(
    input wire in,
    input wire [1:0] sel,
    output wire a,
    output wire b,
    output wire c,
    output wire d
);

    wire ab_sel, cd_sel;

    // First DMux to split between {a, b} and {c, d} based on sel[1]
    DMux dmux1 (
        .in(in),
        .sel(sel[1]),
        .a(ab_sel),
        .b(cd_sel)
    );

    // Second DMux to split {a, b} based on sel[0]
    DMux dmux_ab (
        .in(ab_sel),
        .sel(sel[0]),
        .a(a),
        .b(b)
    );

    // Third DMux to split {c, d} based on sel[0]
    DMux dmux_cd (
        .in(cd_sel),
        .sel(sel[0]),
        .a(c),
        .b(d)
    );

endmodule
