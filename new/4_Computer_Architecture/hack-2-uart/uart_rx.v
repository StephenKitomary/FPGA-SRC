`default_nettype none
`include "baudgen.vh"
`include "baudgen_rx.v"

module uart_rx(
		input wire clk,
		input wire rstn,
		input wire rx,
		output reg rcv,
		output reg [7:0] data
	);

	parameter BAUD = `B115200;

	reg rx_r;
	always @(posedge clk)
		rx_r<=rx;
	
	reg [9:0] shifter;
	always @(posedge clk)
		if (rstn == 0 ) shifter <= 10'b1111111111;
		else if (clk_baud) shifter <= {rx_r,shifter[9:1]};

	always @(posedge clk)
		if (rstn == 0) data <=0;
		else if (load) data <= shifter[8:1];
	
	wire clk_baud;
	baudgen_rx #(BAUD) B1(
		.clk(clk),
		.clk_out(clk_baud),
		.clk_en(baud_en)
	);
	
	reg [3:0] bitc;
	always @(posedge clk)
		if (clear) bitc <= 0;
		else if (clk_baud) bitc <= bitc+1;

	localparam IDLE = 0;
	localparam RCV = 1;
	localparam LOAD = 2;
	localparam DAV = 3;

	reg [1:0] state;
	reg baud_en;
	reg load;
	reg clear;

	always @(posedge clk)
		if (rstn == 0) state <= IDLE;
		else
			case (state)
				IDLE: if (rx_r==0) state <= RCV;
				RCV: if (bitc==10) state <= LOAD;
				LOAD: state <= DAV;
				DAV: state <= IDLE;
				default: state <= IDLE;
			endcase

	always @* begin
		baud_en <= (state==RCV);
		clear <= (state==IDLE);
		rcv <= (state == DAV);
		load <= (state ==LOAD);
	end

endmodule
