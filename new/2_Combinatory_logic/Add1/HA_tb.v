module HA_tb;
  reg a;
  reg b;
  wire [1:0] out;
  integer file;
  HA HA1(.a(a), .b(b), .out(out));
  initial begin
	$dumpfile("HA_tb.vcd");
	$dumpvars(0,HA_tb);
    file = $fopen("HA.out", "w");
    $fwrite(file, "|   a   |   b   |  out  |\n");
    a = 0; b = 0; display();
    a = 0; b = 1; display();
    a = 1; b = 0; display();
    a = 1; b = 1; display();
    $fclose(file);
  end
  task display;
    #1
    $fwrite(file, "|   %1b   |   %1b   |  %2b   |\n", a,b, out);
  endtask
endmodule


