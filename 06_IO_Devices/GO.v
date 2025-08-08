/**
 * GO switches from boot to run mode.
 *
 * Initially, instructions come from ROM (boot mode).
 * When load=1, switch to executing from external SRAM (run mode).
 * The SRAM address is formed from sram_addr register for upper bits
 * and pc for lower bits, allowing execution from different SRAM pages.
 */
`default_nettype none
module GO(
    input clk,
    input load,
    input [15:0] pc,
    input [15:0] sram_addr,
    output [15:0] SRAM_ADDR,
    input [15:0] sram_data,
    input [15:0] ROM_data,
    output [15:0] instruction
);
    reg run_mode;

    always @(posedge clk) begin
        if (load) begin
            run_mode <= 1'b1;  // Switch to SRAM execution
        end
        // Note: No reset condition means once in run_mode, stays there
        // until power cycle
    end

    // Address generation for SRAM
    // Use upper bits from sram_addr register and lower bits from pc
    assign SRAM_ADDR = run_mode ? {sram_addr[15:8], pc[7:0]} : 16'b0;

    // Instruction multiplexer
    assign instruction = run_mode ? sram_data : ROM_data;
endmodule
