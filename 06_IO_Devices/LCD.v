`default_nettype none

module LCD(
    input clk,           // clock 25 MHz
    input load,          // start send command/byte over SPI
    input load16,        // start send data (16 bits)
    input [15:0] in,     // data to be sent
    output reg [15:0] out, // output indicating transmission status
    output reg DCX,      // SPI data/command not
    output reg CSX,      // SPI chip select not
    output reg SDO,      // SPI serial data out
    output reg SCK       // SPI serial clock
);

reg [4:0] bit_counter;   // Counter for tracking bits transmitted
reg [15:0] data_shift;   // Register to shift data bits out
reg [1:0] state;         // State register
reg busy;                // Busy flag to track transmission

// State definitions
localparam IDLE = 2'b00;
localparam LOAD_BYTE = 2'b01;
localparam LOAD_WORD = 2'b10;
localparam TRANSMIT = 2'b11;

always @(posedge clk) begin
    if (load) begin
        state <= LOAD_BYTE;
        bit_counter <= 7;
        DCX <= in[9];
        CSX <= 0;
        data_shift <= {8'b0, in[7:0]};
        busy <= 1;
        out[15] <= 1;
    end
    else if (load16) begin
        state <= LOAD_WORD;
        bit_counter <= 15;
        DCX <= 1;
        CSX <= 0;
        data_shift <= in;
        busy <= 1;
        out[15] <= 1;
    end
    else if (state == LOAD_BYTE || state == LOAD_WORD) begin
        state <= TRANSMIT;
    end
    else if (state == TRANSMIT) begin
        if (bit_counter > 0) begin
            SDO <= data_shift[15];
            SCK <= ~SCK;
            if (SCK) begin
                data_shift <= {data_shift[14:0], 1'b0};
                bit_counter <= bit_counter - 1;
            end
        end else begin
            CSX <= 1;
            busy <= 0;
            out[15] <= 0;
            state <= IDLE;
        end
    end
end

// Set the lower bits of `out` based on the `busy` flag
always @(*) begin
    out = {busy, 15'b0};
end

endmodule
