module DMux_tb;
  reg in;
  reg sel;
  wire a;
  wire b;
  integer file;
  DMux DMUX(.in(in),.sel(sel),.a(a), .b(b));
  initial begin
	$dumpfile("DMux_tb.vcd");
	$dumpvars(0,DMux_tb);
    file = $fopen("DMux.out", "w");
    $fwrite(file, "|  in   |  sel  |   a   |   b   |\n");
    in = 0; sel = 0; display();
    in = 0; sel = 1; display();
    in = 1; sel = 0; display();
    in = 1; sel = 1; display();
    $fclose(file);
  end
  task display;
    #1
    $fwrite(file, "|   %0b   |   %0b   |   %0b   |   %0b   |\n", in,sel,a,b);
  endtask
endmodule


