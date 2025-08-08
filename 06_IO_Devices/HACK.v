/**
 * The HACK computer with complete I/O subsystem
 */
`default_nettype none
module HACK(
    input  CLK,             // external clock 100 MHz
    input  [1:0] BUT,       // user button ("pushed down" == 0) ("up" == 1)
    output [1:0] LED,       // leds (0 off, 1 on)
    input  UART_RX,         // UART receive
    output UART_TX,         // UART transmit
    output SPI_SDO,         // SPI data out
    input  SPI_SDI,         // SPI data in
    output SPI_SCK,         // SPI serial clock
    output SPI_CSX,         // SPI chip select not
    output [17:0] SRAM_ADDR,// SRAM address 18 Bit = 256K
    inout  [15:0] SRAM_DATA,// SRAM data 16 Bit
    output SRAM_WEX,        // SRAM write_enable_not
    output SRAM_OEX,        // SRAM output_enable_not
    output SRAM_CSX,        // SRAM chip_select_not
    output LCD_DCX,         // LCD data/command not
    output LCD_SDO,         // LCD data out
    output LCD_SCK,         // LCD serial clock
    output LCD_CSX,         // LCD chip select not
    input  RTP_SDI,         // RTP data in
    output RTP_SDO,         // RTP data out
    output RTP_SCK          // RTP serial clock
);
    // Internal signals
    wire clk, reset;
    wire [15:0] instruction, rom_instruction, sram_instruction;
    wire [15:0] outM, addressM, pc;
    wire writeM;
    wire [15:0] memOut;

    // I/O device signals
    wire loadRAM, loadIO0, loadIO1, loadIO2, loadIO3, loadIO4, loadIO5;
    wire loadIO6, loadIO7, loadIO8, loadIO9, loadIOA, loadIOB;
    wire loadIOC, loadIOD, loadIOE, loadIOF;

    wire [15:0] outRAM, outIO0, outIO1, outIO2, outIO3, outIO4, outIO5;
    wire [15:0] outIO6, outIO7, outIO8, outIO9, outIOA, outIOB;
    wire [15:0] outIOC, outIOD, outIOE, outIOF;

    // Clock and reset generation
    Clock25_Reset20 clock(
        .CLK(CLK),
        .clk(clk),
        .reset(reset)
    );

    // CPU
    CPU cpu(
        .clk(clk),
        .inM(memOut),
        .instruction(instruction),
        .reset(reset),
        .outM(outM),
        .writeM(writeM),
        .addressM(addressM),
        .pc(pc)
    );

    // ROM
    ROM rom(
        .pc(pc),
        .instruction(rom_instruction)
    );

    // Memory controller
    Memory memory(
        .address(addressM),
        .load(writeM),
        .out(memOut),
        .loadRAM(loadRAM),
        .inRAM(outRAM),
        .loadIO0(loadIO0), .inIO0(outIO0),
        .loadIO1(loadIO1), .inIO1(outIO1),
        .loadIO2(loadIO2), .inIO2(outIO2),
        .loadIO3(loadIO3), .inIO3(outIO3),
        .loadIO4(loadIO4), .inIO4(outIO4),
        .loadIO5(loadIO5), .inIO5(outIO5),
        .loadIO6(loadIO6), .inIO6(outIO6),
        .loadIO7(loadIO7), .inIO7(outIO7),
        .loadIO8(loadIO8), .inIO8(outIO8),
        .loadIO9(loadIO9), .inIO9(outIO9),
        .loadIOA(loadIOA), .inIOA(outIOA),
        .loadIOB(loadIOB), .inIOB(outIOB),
        .loadIOC(loadIOC), .inIOC(outIOC),
        .loadIOD(loadIOD), .inIOD(outIOD),
        .loadIOE(loadIOE), .inIOE(outIOE),
        .loadIOF(loadIOF), .inIOF(outIOF)
    );

    // Internal RAM
    RAM3840 ram0(
        .clk(clk),
        .address(addressM[11:0]),
        .in(outM),
        .load(loadRAM),
        .out(outRAM)
    );

    // IO Device 0x1000: LED Register
    Register regled(
        .clk(clk),
        .in(outM),
        .load(loadIO0),
        .out(outIO0)
    );
    assign LED = outIO0[1:0];

    // IO Device 0x1001: Button Register
    Register regbut(
        .clk(clk),
        .in({14'b0, BUT}),
        .load(1'b1),  // Always update button state
        .out(outIO1)
    );

    // IO Device 0x1002: UART_TX
    UartTX uart_tx(
        .clk(clk),
        .load(loadIO2),
        .in(outM),
        .TX(UART_TX),
        .out(outIO2)
    );

    // IO Device 0x1003: UART_RX
    UartRX uart_rx(
        .clk(clk),
        .clear(loadIO3),
        .RX(UART_RX),
        .out(outIO3)
    );

    // IO Device 0x1004: SPI Flash Controller
    SPI spi(
        .clk(clk),
        .load(loadIO4),
        .in(outM),
        .out(outIO4),
        .CSX(SPI_CSX),
        .SDO(SPI_SDO),
        .SDI(SPI_SDI),
        .SCK(SPI_SCK)
    );

    // IO Device 0x1005: SRAM Address Register
    Register reg_sram_addr(
        .clk(clk),
        .in(outM),
        .load(loadIO5),
        .out(outIO5)
    );

    // IO Device 0x1006: SRAM Data Controller
    wire [15:0] sram_data_from_chip;
    SRAM_D sram_controller(
        .clk(clk),
        .load(loadIO6),
        .in(outM),
        .out(outIO6),
        .DATA(SRAM_DATA),
        .CSX(SRAM_CSX),
        .OEX(SRAM_OEX),
        .WEX(SRAM_WEX)
    );
    assign sram_data_from_chip = outIO6;

    // IO Device 0x1007: GO - Switch to SRAM execution
    GO go_module(
        .clk(clk),
        .load(loadIO7),
        .pc(pc),
        .sram_addr(outIO5),  // Use SRAM address from register 0x1005
        .SRAM_ADDR(SRAM_ADDR[15:0]),
        .sram_data(sram_data_from_chip),
        .ROM_data(rom_instruction),
        .instruction(instruction)
    );
    assign SRAM_ADDR[17:16] = 2'b0;  // Upper address bits unused for now

    // IO Device 0x1008: LCD8 - 8-bit LCD command/data
    wire lcd8_load = loadIO8;
    wire lcd16_load = loadIO9;
    LCD lcd_controller(
        .clk(clk),
        .load(lcd8_load),
        .load16(lcd16_load),
        .in(outM),
        .out(outIO8),  // Status shared with IO8
        .DCX(LCD_DCX),
        .CSX(LCD_CSX),
        .SDO(LCD_SDO),
        .SCK(LCD_SCK)
    );
    assign outIO9 = outIO8;  // LCD16 shares status with LCD8

    // IO Device 0x100A: RTP - Resistive Touch Panel
    RTP rtp(
        .clk(clk),
        .load(loadIOA),
        .in(outM),
        .out(outIOA),
        .SDO(RTP_SDO),
        .SDI(RTP_SDI),
        .SCK(RTP_SCK)
    );

    // IO Devices 0x100B-0x100F: Debug Registers
    Register debug0(
        .clk(clk),
        .in(outM),
        .load(loadIOB),
        .out(outIOB)
    );

    Register debug1(
        .clk(clk),
        .in(outM),
        .load(loadIOC),
        .out(outIOC)
    );

    Register debug2(
        .clk(clk),
        .in(outM),
        .load(loadIOD),
        .out(outIOD)
    );

    Register debug3(
        .clk(clk),
        .in(outM),
        .load(loadIOE),
        .out(outIOE)
    );

    Register debug4(
        .clk(clk),
        .in(outM),
        .load(loadIOF),
        .out(outIOF)
    );
endmodule
