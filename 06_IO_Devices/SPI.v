/**
 * SPI controller for W25Q16BV
 *
 * When load=1 transmission of byte in[7:0] is initiated. The byte is sent to
 * SDO (master out slave in) bitwise together with 8 clock signals on SCK.
 * At the same time the SPI receives a byte at SDI (master in slave out).
 * Sampling of SDI is done at rising edge of SCK and shifting is done at
 * falling edge. CSX control: in[8]=0 sets CSX low, in[8]=1 sets CSX high.
 * During transmission out[15]=1 (busy), when complete out[15]=0 (ready).
 */
`default_nettype none
module SPI(
    input clk,
    input load,
    input [15:0] in,
    output [15:0] out,
    output CSX,
    output SDO,
    input SDI,
    output SCK
);
    reg [7:0] tx_buffer;
    reg [7:0] rx_buffer;
    reg [3:0] bit_counter;
    reg sck_reg;
    reg csx_reg;
    reg busy;
    reg [1:0] clk_counter;  // Divide clock by 4 for slower SPI

    // Shift register for SPI communication
    wire sdo_wire;
    assign sdo_wire = tx_buffer[7];  // MSB first

    always @(posedge clk) begin
        if (load) begin
            if (in[8]) begin
                // Just control CSX, no data transfer
                csx_reg <= 1'b1;
                busy <= 1'b0;
            end else begin
                // Start SPI transfer
                tx_buffer <= in[7:0];
                rx_buffer <= 8'b0;
                bit_counter <= 0;
                clk_counter <= 0;
                sck_reg <= 1'b0;
                csx_reg <= 1'b0;  // Assert chip select
                busy <= 1'b1;
            end
        end else if (busy) begin
            clk_counter <= clk_counter + 1;

            if (clk_counter == 2'b11) begin
                if (sck_reg == 1'b0) begin
                    // Rising edge of SCK - sample SDI
                    sck_reg <= 1'b1;
                    rx_buffer <= {rx_buffer[6:0], SDI};
                end else begin
                    // Falling edge of SCK - shift data
                    sck_reg <= 1'b0;
                    tx_buffer <= {tx_buffer[6:0], 1'b0};

                    if (bit_counter == 7) begin
                        // Transfer complete
                        busy <= 1'b0;
                    end else begin
                        bit_counter <= bit_counter + 1;
                    end
                end
            end
        end else begin
            sck_reg <= 1'b0;  // Keep clock low when idle
        end
    end

    assign SDO = sdo_wire;
    assign SCK = sck_reg;
    assign CSX = csx_reg;
    assign out = {busy, 7'b0, rx_buffer};
endmodule
