/**
 * UartRX receives bytes over UART
 *
 * When clear = 1 the chip clears the receive buffer and is ready to receive
 * next byte. out[15] is set to 1 to show that chip is ready to receive next
 * byte. When RX goes low the chip starts sampling the RX line. After reading
 * of byte completes, chip outputs the received byte to out[7:0] with out[15]=0.
 *
 * Samples in the middle of each bit (at count 108 of 217)
 */
`default_nettype none
module UartRX(
    input clk,
    input clear,
    input RX,
    output [15:0] out
);
    // State machine states
    localparam IDLE = 0;
    localparam START = 1;
    localparam RECEIVE = 2;
    localparam STOP = 3;

    reg [1:0] state;
    reg [7:0] data_buffer;
    reg [7:0] received_data;
    reg [3:0] bit_counter;
    reg [7:0] clk_counter;
    reg data_ready;

    // Edge detection for start bit
    reg rx_sync1, rx_sync2, rx_sync3;
    wire rx_falling_edge;

    always @(posedge clk) begin
        // Synchronize RX signal to clock domain
        rx_sync1 <= RX;
        rx_sync2 <= rx_sync1;
        rx_sync3 <= rx_sync2;
    end

    assign rx_falling_edge = rx_sync3 & ~rx_sync2;

    always @(posedge clk) begin
        if (clear) begin
            state <= IDLE;
            data_ready <= 1'b0;
            received_data <= 8'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (rx_falling_edge) begin
                        // Start bit detected
                        state <= START;
                        clk_counter <= 0;
                        bit_counter <= 0;
                    end
                end

                START: begin
                    if (clk_counter == 108) begin
                        // Sample in the middle of start bit
                        if (~rx_sync2) begin
                            // Valid start bit
                            state <= RECEIVE;
                            clk_counter <= 0;
                            bit_counter <= 0;
                        end else begin
                            // False start, go back to idle
                            state <= IDLE;
                        end
                    end else begin
                        clk_counter <= clk_counter + 1;
                    end
                end

                RECEIVE: begin
                    if (clk_counter == 216) begin
                        clk_counter <= 0;

                        if (bit_counter == 7) begin
                            state <= STOP;
                        end else begin
                            bit_counter <= bit_counter + 1;
                        end
                    end else begin
                        clk_counter <= clk_counter + 1;

                        // Sample in the middle of the bit
                        if (clk_counter == 108) begin
                            data_buffer[bit_counter] <= rx_sync2;
                        end
                    end
                end

                STOP: begin
                    if (clk_counter == 216) begin
                        // Sample stop bit
                        if (rx_sync2) begin
                            // Valid stop bit, data is ready
                            received_data <= data_buffer;
                            data_ready <= 1'b1;
                        end
                        state <= IDLE;
                    end else begin
                        clk_counter <= clk_counter + 1;

                        if (clk_counter == 108) begin
                            // Sample in the middle of stop bit
                            if (rx_sync2) begin
                                // Valid stop bit
                                received_data <= data_buffer;
                                data_ready <= 1'b1;
                            end
                        end
                    end
                end
            endcase
        end
    end

    // out[15] = 0 when data ready, 1 when ready to receive
    assign out = data_ready ? {1'b0, 7'b0, received_data} : {1'b1, 15'b0};
endmodule
