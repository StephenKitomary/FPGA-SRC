`default_nettype  none

module echo(rx,tx);
	input wire rx;
	output wire tx;
	
	assign tx = rx;

endmodule
