module Xor_tb;
  reg a;
  reg b;
  wire out;
  integer file;
  Xor XOR(.a(a), .b(b), .out(out));
  initial begin
	$dumpfile("Xor_tb.vcd");
	$dumpvars(0,Xor_tb);
    file = $fopen("Xor.out", "w");
    $fwrite(file, "|   a   |   b   |  out  |\n");
    a = 0; b = 0; display();
    a = 0; b = 1; display();
    a = 1; b = 0; display();
    a = 1; b = 1; display();
    $fclose(file);
  end
  task display;
    #1
    $fwrite(file, "|   %0b   |   %0b   |   %0b   |\n", a,b, out);
  endtask
endmodule


