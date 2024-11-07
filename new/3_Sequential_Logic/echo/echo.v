`include "baudgen.vh"
`include "uart_rx.v"
`include "uart_tx.v"

module echo(
		input wire clk,
		input wire rx,
		output wire tx
);

	parameter BAUD = `B115200;

	reg rstn=0;
	always @(posedge clk)
		rstn <= 1;

	wire [7:0] data;
	wire rcv;
	uart_rx #(BAUD) RX(
		.clk(clk),
		.rx(rx),
		.rstn(rstn),
		.data(data),
		.rcv(rcv)
	);

	uart_tx #(BAUD) TX(
		.clk(clk),
		.rstn(rstn),
		.data(data),
		.start(rcv),
		.tx(tx)
	);
endmodule

