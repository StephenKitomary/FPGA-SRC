`default_nettype none
//`include "baudgen.vh"
//`include "baudgen.v"

module spi(
		input wire clk,
		input wire rstn,
		input wire startC,
		input wire startD8,
		input wire startD16,
		input wire [15:0] data,
		output reg spi_cdn,
		output reg spi_cen,
		output wire spi_mosi,
		output reg spi_sck,
		output wire ready
);

parameter BAUD = 5;

wire clk_baud;
reg [4:0] bitc;
reg [17:0] data_r;
wire c_load;
wire c_baud_en;
wire c_shift;
wire c_clock;
wire c_stop;

always @(posedge clk)
	if (!rstn) spi_sck <= 0;
	else if (c_clock) spi_sck <= 1;
	else if (c_shift) spi_sck <= 0;

always @(posedge clk)
	if (!rstn) spi_cdn <= 0;
	else if (c_load) spi_cdn <= !data_r[16];
	else if (c_stop) spi_cdn <= 0;
always @(posedge clk)
	if (!rstn) spi_cen <= 1;
	else if (c_load) spi_cen <= 0;
	else if (c_stop) spi_cen <= 1;

reg [15:0] shifter;
always @(posedge clk)
	if (!rstn) shifter <= 16'b0000000000000000;
	else if (c_load) shifter <= data_r;
	else if (c_shift) shifter <= {shifter[15:0],1'b0};

always @(posedge clk)
	if (!rstn) data_r <= 18'b00000000000000000;
	else if (startC) data_r[17:8] <= {2'b01,data[7:0]};
	else if (startD8) data_r[17:8] <= {2'b00,data[7:0]};
	else if (startD16) data_r[17:0] <= {2'b10,data[15:0]};

always @(posedge clk)
  if (!rstn) bitc <=0;
  else if (c_load & data_r[17]) bitc <= 15;
  else if (c_load) bitc <= 7;
  else if (c_shift) bitc <= bitc - 1;

assign spi_mosi = shifter[15];

baudgen #(BAUD)
	BAUD0(
		.clk(clk),
		.clk_ena(c_baud_en),
		.clk_out(clk_baud)
);

assign c_load = (clk_baud & (state == START)) ? 1: 0;
assign c_shift = (clk_baud & (state == DATA)) ? 1: 0;
assign c_stop = (clk_baud & (state == DATA) & (bitc==0)) ? 1: 0;
assign c_clock = (clk_baud & (state == CLOCK)) ? 1: 0;
assign ready = (state == IDLE) ? 1: 0;
assign c_baud_en = (state != IDLE) ? 1: 0;

localparam IDLE = 0;
localparam DATA = 1;
localparam CLOCK = 2;
localparam START =3;
reg [1:0] state;
always @(posedge clk)
	if (!rstn) state <= IDLE;
	else 
		case (state)
			IDLE:
				if (startC | startD8 | startD16) state <= START;
				else state <= IDLE;
			START:
				if (clk_baud) state <= CLOCK;
			DATA:
				if (clk_baud & (bitc==0)) state <= IDLE;
				else if (clk_baud) state <= CLOCK;
				else state <= DATA;
			CLOCK:
				if (clk_baud) state <= DATA;
				else state <= CLOCK;
			default:
				state <= IDLE;
		endcase
	
endmodule
