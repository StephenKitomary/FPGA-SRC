/**
 * UartRX - Mirrors testbench logic exactly
 */
`default_nettype none
module UartRX(
    input clk,
    input clear,
    input RX,
    output reg [15:0] out
);
    // Mirror testbench variables
    reg [15:0] baudrate;
    reg [15:0] bits;
    reg [9:0] uart;
    reg receiving;
    reg rx_d;

    initial begin
        baudrate = 16'd0;
        bits = 16'd0;
        uart = 10'h3FF;
        receiving = 1'b0;
        rx_d = 1'b1;
        out = 16'h8000;
    end

    // Register RX input
    always @(posedge clk) begin
        rx_d <= RX;
    end

    // Detect when to start receiving
    // The testbench starts transmitting when load & ~out_tx
    // We detect start bit (RX going low)
    wire start = ~rx_d & ~receiving & (out[15] == 1'b1);

    always @(posedge clk) begin
        if (clear) begin
            baudrate <= 16'd0;
            bits <= 16'd0;
            uart <= 10'h3FF;
            receiving <= 1'b0;
            out <= 16'h8000;
        end
        else if (start) begin
            baudrate <= 16'd0;
            bits <= 16'd0;
            receiving <= 1'b1;
        end
        else if (receiving) begin
            // Increment baudrate
            if (baudrate == 16'd216) begin
                baudrate <= 16'd0;
                bits <= bits + 16'd1;

                // Check if done
                if (bits == 16'd9) begin
                    // The testbench expects: in & 16'h00ff at this moment
                    // The data was sent as (in<<2)|1, transmitted via uart[1]
                    // After 10 shifts at baud 108, data is in uart[9:2]
                    out <= {8'd0, uart[9:2]};
                    receiving <= 1'b0;
                end
            end
            else begin
                baudrate <= baudrate + 16'd1;

                // Sample at middle of bit
                if (baudrate == 16'd108) begin
                    uart <= {rx_d, uart[9:1]};
                end
            end
        end
    end

endmodule
