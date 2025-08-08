/*
 * LCD communicates with ILI9341V LCD controller over 4 wire SPI.
 *
 * When load=1 and in[8]=0 transmission of byte in[7:0] is initiated.
 * CSX goes low (and stays low even when transmission is completed).
 * DCX is set to in[9]. The byte in[7:0] is sent to SDO bitwise together
 * with 8 clock signals on SCK. During transmission out[15] is 1.
 * After 16 clock cycles transmission is completed and out[15] is set to 0.
 *
 * When load=1 and in[8]=1 CSX goes high and DCX=in[9] without transmission
 * of any bit.
 *
 * When load16=1 transmission of word in[15:0] is initiated. CSX goes low
 * (and stays low even when transmission is completed). DCX is set to 1 (data).
 * After 32 clock cycles transmission is completed and out[15] is set to 0.
*/
`default_nettype none
module LCD(
    input clk,          // clock 25 MHz
    input load,         // start send command/byte over SPI
    input load16,       // start send data (16 bits)
    input [15:0] in,    // data to be sent
    output [15:0] out,  // status output
    output DCX,         // SPI data/command not
    output CSX,         // SPI chip select not
    output SDO,         // SPI serial data out
    output SCK          // SPI serial clock
);
    reg [15:0] shift_reg;
    reg [4:0] bit_counter;
    reg busy;
    reg csx_reg;
    reg dcx_reg;
    reg sck_reg;
    reg mode_16bit;

    wire sdo_wire;
    assign sdo_wire = mode_16bit ? shift_reg[15] : shift_reg[7];  // MSB first

    always @(posedge clk) begin
        if (load) begin
            if (in[8]) begin
                // Control CSX without data transfer
                csx_reg <= 1'b1;
                dcx_reg <= in[9];
                busy <= 1'b0;
            end else begin
                // 8-bit transfer
                shift_reg <= {8'b0, in[7:0]};
                bit_counter <= 0;
                csx_reg <= 1'b0;
                dcx_reg <= in[9];
                busy <= 1'b1;
                mode_16bit <= 1'b0;
                sck_reg <= 1'b0;
            end
        end else if (load16) begin
            // 16-bit transfer
            shift_reg <= in;
            bit_counter <= 0;
            csx_reg <= 1'b0;
            dcx_reg <= 1'b1;  // Data mode for 16-bit
            busy <= 1'b1;
            mode_16bit <= 1'b1;
            sck_reg <= 1'b0;
        end else if (busy) begin
            if (sck_reg == 1'b0) begin
                // Rising edge - shift data
                sck_reg <= 1'b1;
            end else begin
                // Falling edge
                sck_reg <= 1'b0;

                if (mode_16bit) begin
                    shift_reg <= {shift_reg[14:0], 1'b0};
                    if (bit_counter == 15) begin
                        busy <= 1'b0;
                    end else begin
                        bit_counter <= bit_counter + 1;
                    end
                end else begin
                    shift_reg[7:0] <= {shift_reg[6:0], 1'b0};
                    if (bit_counter == 7) begin
                        busy <= 1'b0;
                    end else begin
                        bit_counter <= bit_counter + 1;
                    end
                end
            end
        end else begin
            sck_reg <= 1'b0;
        end
    end

    assign SDO = sdo_wire;
    assign SCK = sck_reg;
    assign CSX = csx_reg;
    assign DCX = dcx_reg;
    assign out = {busy, 15'b0};
endmodule
