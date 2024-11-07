module Not_tb;
  reg in;
  wire out;
  integer file;
  Not NOT(.in(in), .out(out));
  initial begin
	$dumpfile("Not_tb.vcd");
	$dumpvars(0,Not_tb);
    file = $fopen("Not.out", "w");
    $fwrite(file, "|  in   |  out  |\n");
    in = 0; display();
    in = 1; display();
    $fclose(file);
  end
  task display;
    #1
    $fwrite(file, "|   %0b   |   %0b   |\n", in, out);
  endtask
endmodule


