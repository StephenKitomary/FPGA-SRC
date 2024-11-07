`default_nettype none
`include "baudgen.vh"
`include "baudgen.v"

module uart_tx(
		input wire clk,
		input wire rstn,
		input wire start,
		input wire [7:0] data,
		output reg tx,
		output wire ready
);

parameter BAUD = `B115200;

reg start_r;
wire clk_baud;
reg [3:0] bitc;
reg [7:0] data_r;
wire load;
wire baud_en;

always @(posedge clk)
	start_r <= start;

always @(posedge clk)
	if (start == 1 && state == IDLE)
		data_r <= data;

reg [9:0] shifter;

always @(posedge clk)
	if (rstn == 0)
		shifter <= 10'b1111111111;
	else if (load ==1 )
		shifter <= {data_r,2'b01};
	else if (load ==0 && clk_baud==1)
		shifter <= {1'b1, shifter[9:1]};

always @(posedge clk)
  if (load == 1)
    bitc <= 0;
  else if (load == 0 && clk_baud == 1)
    bitc <= bitc + 1;

always @(posedge clk)
	tx <= shifter[0];

baudgen #(BAUD)
	BAUD0(
		.clk(clk),
		.clk_ena(baud_en),
		.clk_out(clk_baud)
);

localparam IDLE = 0;
localparam START = 1;
localparam TRANS = 2;

reg [1:0] state;

always @(posedge clk)
	if (rstn == 0)
		state <= IDLE;
	else
		case (state)
			IDLE:
				if (start_r == 1)
					state <= START;
				else
					state <= IDLE;
			START:
				state <= TRANS;
			TRANS:
				if (bitc==11)
					state <= IDLE;
				else
					state <= TRANS;
			default:
				state <= IDLE;
		endcase

assign load = (state == START) ? 1 : 0;
assign baud_en = (state == IDLE) ? 0 : 1;
assign ready = (state == IDLE) ? 1 : 0;
endmodule
