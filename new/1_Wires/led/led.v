`default_nettype  none

module led(but1,led1);
	input wire but1;
	output wire led1;

	assign led1 = but1;
endmodule
