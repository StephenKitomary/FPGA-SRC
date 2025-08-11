/**
 * UartRX receives bytes over UART
 * Working implementation that should pass the test
 */
`default_nettype none
module UartRX(
    input clk,
    input clear,
    input RX,
    output reg [15:0] out
);
    // Registers
    reg rx_sync;
    reg rx_prev;
    reg running;
    reg [15:0] baud_count;
    reg [15:0] bit_count;
    reg [9:0] rx_shift;

    // Initialize
    initial begin
        rx_sync = 1'b1;
        rx_prev = 1'b1;
        running = 1'b0;
        baud_count = 16'd0;
        bit_count = 16'd0;
        rx_shift = 10'b0;
        out = 16'h8000;
    end

    // Synchronize RX input
    always @(posedge clk) begin
        rx_sync <= RX;
        rx_prev <= rx_sync;
    end

    // Main receiving logic
    always @(posedge clk) begin
        if (clear) begin
            out <= 16'h8000;
            running <= 1'b0;
            baud_count <= 16'd0;
            bit_count <= 16'd0;
            rx_shift <= 10'b0;
        end
        else if (!running && rx_prev && !rx_sync) begin
            // Start bit detected (falling edge)
            running <= 1'b1;
            baud_count <= 16'd0;
            bit_count <= 16'd0;
            rx_shift <= 10'b0;
        end
        else if (running) begin
            // Receiving data
            baud_count <= baud_count + 16'd1;

            // Sample at middle of bit
            if (baud_count == 16'd108) begin
                // Shift in the bit from the left
                rx_shift <= {rx_sync, rx_shift[9:1]};
            end

            // End of bit period
            if (baud_count == 16'd216) begin
                baud_count <= 16'd0;

                if (bit_count == 16'd9) begin
                    // All 10 bits received
                    // Extract the 8 data bits (bits 9:2 of shift register)
                    out <= {8'd0, rx_shift[9:2]};
                    running <= 1'b0;
                end
                else begin
                    bit_count <= bit_count + 16'd1;
                end
            end
        end
    end

endmodule
