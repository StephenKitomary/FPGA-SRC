module Mux_tb;
  reg a;
  reg b;
  reg sel;
  wire out;
  integer file;
  Mux MUX(.a(a), .b(b), .sel(sel), .out(out));
  initial begin
	$dumpfile("Mux_tb.vcd");
	$dumpvars(0,Mux_tb);
    file = $fopen("Mux.out", "w");
    $fwrite(file, "|   a   |   b   |  sel  |  out  |\n");
    a = 0; b = 0; sel = 0; display();
    a = 0; b = 0; sel = 1; display();
    a = 0; b = 1; sel = 0; display();
    a = 0; b = 1; sel = 1; display();
    a = 1; b = 0; sel = 0; display();
    a = 1; b = 0; sel = 1; display();
    a = 1; b = 1; sel = 0; display();
    a = 1; b = 1; sel = 1; display();
    $fclose(file);
  end
  task display;
    #1
    $fwrite(file, "|   %0b   |   %0b   |   %0b   |   %0b   |\n", a,b,sel,out);
  endtask
endmodule


