/**
 * SRAM controller:
 * If load[t] == 1 then out[t+1] = in[t]
 *                      OEX[t+1] = 1
 *                      WEX[t+1] = 0
 *                      DATA[t+1] = in[t] (DATA is configured as output)
 * At any other time:
 * out = DATA (DATA is configured as input)
 * CSX = 0 (always enabled)
 */
`default_nettype none
module SRAM_D(
    input clk,
    input load,
    input [15:0] in,
    output [15:0] out,
    inout [15:0] DATA,  // SRAM data 16 Bit
    output CSX,         // SRAM chip_enable_not
    output OEX,         // SRAM output_enable_not
    output WEX          // SRAM write_enable_not
);
    reg [15:0] data_out_reg;
    reg write_enable;
    reg [15:0] read_data;

    // Use the InOut module for tristate control
    wire [15:0] data_read;
    InOut io_buffer(
        .PIN(DATA),
        .dataW(data_out_reg),
        .dataR(data_read),
        .dir(write_enable)
    );

    always @(posedge clk) begin
        if (load) begin
            // Write cycle
            data_out_reg <= in;
            write_enable <= 1'b1;
        end else begin
            // Read cycle
            write_enable <= 1'b0;
            read_data <= data_read;
        end
    end

    // Control signals
    assign CSX = 1'b0;  // Chip always selected
    assign OEX = write_enable;  // Output disabled during write
    assign WEX = ~write_enable;  // Write enabled when write_enable is high
    assign out = write_enable ? data_out_reg : data_read;
endmodule
