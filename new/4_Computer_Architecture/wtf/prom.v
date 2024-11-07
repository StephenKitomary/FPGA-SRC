module prom(
		input wire [15:0] in,
		input wire clk,
		input wire writeA,
		input wire writeD,
		output reg [15:0] sram_addr,
		output reg [15:0] sram_data,
		input wire rstn,	
		output wire [17:0] SRAM_addr,
		inout wire [15:0] SRAM_data,
		output reg SRAM_wen,
		output reg SRAM_oen,
		output reg SRAM_cen
);
	// add_data 0 address to SRAM
	// add_data 1 data to <> SRAM

	localparam IDLE = 0;
	localparam DATA_W = 1;
	localparam DATA_C = 2;
	localparam ADDR = 3;
	localparam DATA_R = 4;
	
	assign SRAM_addr = (SRAM_cen) ? 18'bzzzzzzzzzzzzzzzzzz :{2'b00,sram_addr} ;
	always @(posedge clk)
		if (!rstn) sram_data <= 0;
		else if (state==ADDR) sram_data <= SRAM_data;
		else if (writeD) sram_data <= in;
	
	always @(posedge clk)
		if (!rstn) sram_addr <= 0;
		else if (writeA) sram_addr <= in;
	
	reg SRAM_data_hz;
	always @(posedge clk)
		if (!rstn) SRAM_data_hz <= 1;
		else SRAM_data_hz <= next_data_hz;
	
	assign SRAM_data = (SRAM_data_hz) ? 16'bzzzzzzzzzzzzzzzz : sram_data;

	always @(negedge clk)
		if (!rstn) SRAM_wen <= 1;
		else if (state==DATA_W) SRAM_wen<= 0;
		else if (state==DATA_C) SRAM_wen<= 1;

	always @(posedge clk)
		if (!rstn) SRAM_oen <= 1;
		else SRAM_oen <= next_oen;
	
	always @(posedge clk)
		if (!rstn) SRAM_cen <= 1;
		else SRAM_cen <= next_cen;

	reg [2:0] next_state;
	reg [2:0] state;
	always @(posedge clk)
		if (!rstn) state <= IDLE;
		else state <= next_state;
	
	reg next_cen;
	reg next_oen;
	reg next_data_hz;

	always @(*) begin
		next_oen=1;
		next_cen=1;
		next_data_hz=1;
		next_state = IDLE;
		case (state)
			IDLE:
				if (writeD) begin 
						next_state = DATA_W;
						next_data_hz = 0;
						next_cen=0;
					end
				else if (writeA) begin
						next_state = ADDR;
						next_oen=0;
						next_cen=0;
					end
				else next_state = IDLE;
			DATA_W:
				begin
					next_cen=0;
					next_state = DATA_C;
					next_data_hz = 0;
				end
			DATA_C:
				begin
					next_state = IDLE;
				end
			ADDR:
				begin
					next_oen=0;
					next_cen=0;
					next_state = DATA_R;
				end
			DATA_R: begin
					next_state = IDLE;
					next_cen = 1;
					next_oen = 1;
				end
		endcase
	end

endmodule
