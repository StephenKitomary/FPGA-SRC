/**
 * UartTX controls transmission of bytes over UART.
 *
 * When load = 1 the chip starts serial transmission of the byte in[7:0] to the
 * TX line according to the protocol 8N1 with 115200 baud. During transmission
 * out[15] is set to high (busy). The transmission is finished after 2170 clock
 * cycles (10 bits at 217 cycles each). When transmission completes out[15] goes
 * low again (ready).
 */
`default_nettype none
module UartTX(
    input clk,
    input load,
    input [15:0] in,
    output TX,
    output [15:0] out
);
    // Constants
    localparam CLOCKS_PER_BIT = 217;
    localparam TOTAL_BITS = 10;  // 1 start + 8 data + 1 stop

    // State register (0 = ready, 1 = busy)
    reg busy;

    // Bit counter (0-216) for baud rate generation
    reg [7:0] clk_counter;

    // Bit position counter (0-9) for the 10 bits to send
    reg [3:0] bit_counter;

    // Shift register to hold the data to transmit
    // Will hold: stop bit (1), 8 data bits, start bit (0)
    reg [9:0] tx_shift_reg;

    // TX output register
    reg tx_out;

    // Initialize
    initial begin
        busy = 1'b0;
        clk_counter = 8'b0;
        bit_counter = 4'b0;
        tx_shift_reg = 10'b0;
        tx_out = 1'b1;  // Idle state is high
    end

    always @(posedge clk) begin
        if (load && !busy) begin
            // Load new byte to transmit
            // Format: stop bit (1) + data bits + start bit (0)
            // The shift register will shift right, so bit 0 goes out first
            tx_shift_reg <= {1'b1, in[7:0], 1'b0};  // Stop, D7..D0, Start
            busy <= 1'b1;
            clk_counter <= 8'b0;
            bit_counter <= 4'b0;
        end
        else if (busy) begin
            if (clk_counter == CLOCKS_PER_BIT - 1) begin
                // Time to move to next bit
                clk_counter <= 8'b0;

                if (bit_counter == TOTAL_BITS - 1) begin
                    // Transmission complete
                    busy <= 1'b0;
                    tx_out <= 1'b1;  // Return to idle state
                end
                else begin
                    // Move to next bit
                    bit_counter <= bit_counter + 1;
                    tx_shift_reg <= {1'b1, tx_shift_reg[9:1]};  // Shift right
                end
            end
            else begin
                // Count clock cycles
                clk_counter <= clk_counter + 1;
            end

            // Output current bit
            tx_out <= tx_shift_reg[0];
        end
        else begin
            // Idle state
            tx_out <= 1'b1;
        end
    end

    // Outputs
    assign TX = tx_out;
    assign out = {busy, 15'b0};  // out[15] = busy flag

endmodule
