`include "divider.vh"
module blink_tb();

reg clk = 0;
wire [N-1:0] data;
parameter N=4;
parameter M=`F_10MHz;

blink #(.N(N),.M(M))
  BLINK(
    .clk(clk),
    .data(data)
  );

always #1 clk = ~clk;

initial begin

  $dumpfile("blink_tb.vcd");
  $dumpvars(0, blink_tb);

  # 10000
  $finish;
end

endmodule

