// 4-way 16-bit multiplexor in Verilog.
// out = a if sel == 00
//       b if sel == 01
//       c if sel == 10
//       d if sel == 11

`default_nettype none

module Mux4Way16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] c,
    input wire [15:0] d,
    input wire [1:0] sel,
    output wire [15:0] out
);

    wire [15:0] q, r;

    // First two multiplexers: select between a-b and c-d
    Mux16 mux1 (
        .a(a),
        .b(b),
        .sel(sel[0]),
        .out(q)
    );

    Mux16 mux2 (
        .a(c),
        .b(d),
        .sel(sel[0]),
        .out(r)
    );

    // Final multiplexer: select between q and r based on sel[1]
    Mux16 mux3 (
        .a(q),
        .b(r),
        .sel(sel[1]),
        .out(out)
    );

endmodule



