module led_tb();
	reg but1=0;
	wire led1;

	led dut(
			.led1(led1),
			.but1(but1)
		);

	initial begin
  		$dumpfile("led_tb.vcd");
  		$dumpvars(0, led_tb);
  		#100 but1 <= 1;
		#100 but1 <= 0;
   		$finish;
	end

endmodule
