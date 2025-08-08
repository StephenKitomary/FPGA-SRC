/**
 * UartTX controls transmission of bytes over UART.
 *
 * When load = 1 the chip starts serial transmission of the byte in[7:0] to the
 * TX line according to the protocol 8N1 with 115200 baud. During transmission
 * out[15] is set to high (busy). The transmission is finished after 2170 clock
 * cycles (10 bits at 217 cycles each). When transmission completes out[15] goes
 * low again (ready).
 *
 * Clock: 25MHz / 217 ≈ 115207 baud (close to 115200)
 * Format: 1 start bit (0), 8 data bits, 1 stop bit (1) = 10 bits total
 */
`default_nettype none
module UartTX(
    input clk,
    input load,
    input [15:0] in,
    output TX,
    output [15:0] out
);
    // State machine states
    localparam IDLE = 0;
    localparam TRANSMIT = 1;

    reg state;
    reg [7:0] data_buffer;
    reg [3:0] bit_counter;  // Counts 0-9 (10 bits total)
    reg [7:0] clk_counter;  // Counts 0-216 (217 clocks per bit)
    reg tx_reg;

    // Busy flag
    wire busy = (state == TRANSMIT);

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                if (load) begin
                    state <= TRANSMIT;
                    data_buffer <= in[7:0];
                    bit_counter <= 0;
                    clk_counter <= 0;
                end
                tx_reg <= 1'b1;  // Idle state is high
            end

            TRANSMIT: begin
                if (clk_counter == 216) begin
                    clk_counter <= 0;

                    if (bit_counter == 9) begin
                        // Transmission complete
                        state <= IDLE;
                    end else begin
                        bit_counter <= bit_counter + 1;
                    end
                end else begin
                    clk_counter <= clk_counter + 1;
                end

                // Output the appropriate bit
                case (bit_counter)
                    0: tx_reg <= 1'b0;  // Start bit
                    1: tx_reg <= data_buffer[0];
                    2: tx_reg <= data_buffer[1];
                    3: tx_reg <= data_buffer[2];
                    4: tx_reg <= data_buffer[3];
                    5: tx_reg <= data_buffer[4];
                    6: tx_reg <= data_buffer[5];
                    7: tx_reg <= data_buffer[6];
                    8: tx_reg <= data_buffer[7];
                    9: tx_reg <= 1'b1;  // Stop bit
                    default: tx_reg <= 1'b1;
                endcase
            end
        endcase
    end

    assign TX = tx_reg;
    assign out = {busy, 15'b0};
endmodule
