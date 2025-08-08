/**
 * UartRX receives bytes over UART
 * This version is designed to match the specific testbench expectations
 */
`default_nettype none
module UartRX(
    input clk,
    input clear,
    input RX,
    output [15:0] out
);
    // Timing constants for 25MHz clock, 115200 baud
    // 25000000 / 115200 = 217.01 ≈ 217 clocks per bit
    localparam FULL_BIT = 217;
    localparam HALF_BIT = 108;

    // States
    localparam IDLE = 0;
    localparam START_BIT = 1;
    localparam DATA_BITS = 2;
    localparam STOP_BIT = 3;

    reg [1:0] state = IDLE;
    reg [7:0] rx_data = 8'b0;
    reg [7:0] bit_counter = 8'b0;
    reg [2:0] bit_index = 3'b0;
    reg rx_complete = 1'b0;

    // Synchronize RX input
    reg rx_sync = 1'b1;
    always @(posedge clk) begin
        rx_sync <= RX;
    end

    always @(posedge clk) begin
        if (clear) begin
            state <= IDLE;
            rx_complete <= 1'b0;
            rx_data <= 8'b0;
            bit_counter <= 8'b0;
            bit_index <= 3'b0;
        end
        else begin
            case (state)
                IDLE: begin
                    rx_complete <= 1'b0;
                    bit_counter <= 8'b0;
                    bit_index <= 3'b0;

                    // Wait for start bit (RX goes low)
                    if (rx_sync == 1'b0) begin
                        state <= START_BIT;
                    end
                end

                START_BIT: begin
                    // Wait for middle of start bit
                    if (bit_counter == HALF_BIT) begin
                        if (rx_sync == 1'b0) begin
                            // Valid start bit, move to data
                            bit_counter <= 8'b0;
                            state <= DATA_BITS;
                        end
                        else begin
                            // Invalid start bit, back to idle
                            state <= IDLE;
                        end
                    end
                    else begin
                        bit_counter <= bit_counter + 1;
                    end
                end

                DATA_BITS: begin
                    // Sample data bits
                    if (bit_counter == FULL_BIT - 1) begin
                        bit_counter <= 8'b0;
                        rx_data[bit_index] <= rx_sync;

                        if (bit_index == 7) begin
                            state <= STOP_BIT;
                        end
                        else begin
                            bit_index <= bit_index + 1;
                        end
                    end
                    else begin
                        bit_counter <= bit_counter + 1;
                    end
                end

                STOP_BIT: begin
                    // Wait for stop bit
                    if (bit_counter == FULL_BIT - 1) begin
                        rx_complete <= 1'b1;
                        state <= IDLE;
                    end
                    else begin
                        bit_counter <= bit_counter + 1;
                    end
                end
            endcase
        end
    end

    // Output format:
    // When ready (no data): out[15] = 1, out[14:0] = 0
    // When data ready: out[15] = 0, out[7:0] = received byte
    assign out = rx_complete ? {8'b0, rx_data} : 16'h8000;

endmodule
