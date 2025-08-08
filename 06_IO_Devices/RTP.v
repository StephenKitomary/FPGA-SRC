/**
 * The special function register RTP receives bytes from the touch panel
 * controller AR1021.
 *
 * When load=1 transmission of byte in[7:0] is initiated. The byte is sent to
 * SDO bitwise together with 8 clock signals on SCK. At the same time RTP
 * receives a byte at SDI. During transmission out[15] is 1. The transmission
 * of a byte takes 256 clock cycles (32 cycles for each bit to achieve a slower
 * transfer rate). Every 32 clock cycles one bit is shifted out. In the middle
 * of each bit at counter number 31 the bit SDI is sampled. When transmission
 * is completed out[15]=0 and RTP outputs the received byte to out[7:0].
 */
`default_nettype none
module RTP(
    input clk,
    input load,
    input [15:0] in,
    output [15:0] out,
    output SDO,
    input SDI,
    output SCK
);
    reg [7:0] tx_buffer;
    reg [7:0] rx_buffer;
    reg [3:0] bit_counter;
    reg [4:0] clk_counter;  // 0-31 for slow transfer
    reg busy;
    reg sck_reg;
    reg [7:0] received_data;

    wire sdo_wire;
    assign sdo_wire = tx_buffer[7];  // MSB first

    always @(posedge clk) begin
        if (load) begin
            tx_buffer <= in[7:0];
            rx_buffer <= 8'b0;
            bit_counter <= 0;
            clk_counter <= 0;
            busy <= 1'b1;
            sck_reg <= 1'b0;
        end else if (busy) begin
            clk_counter <= clk_counter + 1;

            if (clk_counter == 15) begin
                // Rising edge of SCK (middle of first half)
                sck_reg <= 1'b1;
            end else if (clk_counter == 31) begin
                // Sample SDI at the end of bit period
                rx_buffer <= {rx_buffer[6:0], SDI};

                // Falling edge of SCK
                sck_reg <= 1'b0;

                // Shift tx buffer for next bit
                tx_buffer <= {tx_buffer[6:0], 1'b0};

                // Reset counter and check if done
                clk_counter <= 0;

                if (bit_counter == 7) begin
                    // Transfer complete
                    busy <= 1'b0;
                    received_data <= {rx_buffer[6:0], SDI};
                end else begin
                    bit_counter <= bit_counter + 1;
                end
            end
        end else begin
            sck_reg <= 1'b0;
        end
    end

    assign SDO = sdo_wire;
    assign SCK = sck_reg;
    assign out = busy ? {1'b1, 15'b0} : {1'b0, 7'b0, received_data};
endmodule
