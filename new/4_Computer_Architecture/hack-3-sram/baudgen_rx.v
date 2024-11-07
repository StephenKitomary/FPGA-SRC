`include "baudgen.vh"

module baudgen_rx(
		input wire clk,
		input wire clk_en,
		output wire clk_out
	);

	parameter M=`B115200;
	localparam N=$clog2(M);
	localparam M2 = (M>>1);

	reg [N-1:0] counter = 0;

	always @(posedge clk)
		if (clk_en) counter <= (counter == M-1) ? 0 : counter+1;
		else counter <= M-1;

	assign clk_out = (counter == M2) ? clk_en: 0;

endmodule
