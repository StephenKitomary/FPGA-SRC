/**
 * UartRX receives bytes over UART
 * Working implementation that passes the testbench
 */
`default_nettype none
module UartRX(
    input clk,
    input clear,
    input RX,
    output reg [15:0] out
);
    // Internal registers
    reg rx_d, rx_dd;  // Double register for RX
    reg receiving;
    reg [15:0] baudrate;
    reg [15:0] bits;
    reg [7:0] data_byte;
    reg [7:0] shift_count;

    // Initialize
    initial begin
        rx_d = 1'b1;
        rx_dd = 1'b1;
        receiving = 1'b0;
        baudrate = 16'd0;
        bits = 16'd0;
        data_byte = 8'd0;
        shift_count = 8'd0;
        out = 16'h8000;
    end

    // Double-register RX for clock domain crossing
    always @(posedge clk) begin
        rx_d <= RX;
        rx_dd <= rx_d;
    end

    // Main receiving logic
    always @(posedge clk) begin
        if (clear) begin
            receiving <= 1'b0;
            baudrate <= 16'd0;
            bits <= 16'd0;
            data_byte <= 8'd0;
            shift_count <= 8'd0;
            out <= 16'h8000;  // Ready state
        end
        else begin
            // Start bit detection
            if (!receiving && rx_dd == 1'b0) begin
                receiving <= 1'b1;
                baudrate <= 16'd0;
                bits <= 16'd0;
                shift_count <= 8'd0;
            end

            // Receiving state
            if (receiving) begin
                if (baudrate == 16'd216) begin
                    baudrate <= 16'd0;

                    // Check if we've received all bits
                    if (bits == 16'd9) begin
                        // Output the received byte
                        out <= {8'd0, data_byte};
                        receiving <= 1'b0;
                    end
                    else begin
                        bits <= bits + 16'd1;
                    end
                end
                else begin
                    baudrate <= baudrate + 16'd1;

                    // Sample at middle of bit (108)
                    if (baudrate == 16'd108) begin
                        if (bits > 0 && bits <= 8) begin
                            // Sample data bits (bits 1-8 are data)
                            data_byte[bits-1] <= rx_dd;
                        end
                    end
                end
            end
        end
    end

endmodule
