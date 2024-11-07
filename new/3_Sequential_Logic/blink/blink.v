`default_nettype none
`include "divider.vh"

module blink(clk,data);
	parameter N=2;	
	parameter M=`F_1Hz;
	input wire clk;
	output wire [N-1:0] data;
		
	wire clk_1Hz;
	
	divider #(.M(M)) DIV1(.clk_in(clk),.clk_out(clk_1Hz));
	counter #(.N(N)) C1(.clk(clk_1Hz),.dout(data));
endmodule

