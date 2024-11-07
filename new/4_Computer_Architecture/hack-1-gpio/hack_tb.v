module hack_tb;
  reg clk=0;
  reg [1:0] but;
  wire [1:0] led;
  hack hack1(.clk(clk),.but(but), .led(led));

  always #1 clk = ~clk;
  
  initial begin
	$dumpfile("hack_tb.vcd");
	$dumpvars(0,hack_tb);
    #1 but <= 2'b00;
    #100 but <= 2'b01;
    #100 but <= 2'b10;
    #100 but <= 2'b11;
	#100;
	$finish;  
  end

endmodule


