module And_tb;
  reg a;
  reg b;
  wire out;
  integer file;
  And AND(.a(a), .b(b), .out(out));
  initial begin
	$dumpfile("And_tb.vcd");
	$dumpvars(0,And_tb);
    file = $fopen("And.out", "w");
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


