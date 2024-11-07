`default_nettype none
`include "baudgen.vh"

module hack(						//Olimex iCEHX8-EVB
    input wire clk,					//clock 100 MHz	
    input wire [1:0] but,			//buttons	(0 if pressed, 1 if released)
	output reg [1:0] led,			//leds 		(0 off, 1 on)
	output wire tx,					//UART TX on UEXT-Connector
	input wire rx,					//UART RX on UEXT-Connector
	output wire [17:0] sram_addr,	//SRAM Address 18 Bit = 256K
	inout wire [15:0] sram_data,	//SRAM Data 16 Bit
	output wire sram_wen,			//SRAM write_enable_not
	output wire sram_oen,			//SRAM output_enable_not
	output wire sram_cen 			//SRAM chip_enable_not
);
	
	// parameters of hack
	parameter BAUD = `B115200;						//Baudrate UART

	// reset logic	
	reg rstn=0;						//reset_not
	always @(posedge clk)			//used to initialize all register
		rstn <=1;
	
	// hack cpu (nand2tetris)
	cpu cpu(						
		.clk(clk),
    	.inM(outM),         		// M value input  (M = contents of RAM[A])
    	.instruction(instruction), 	// Instruction for execution
    	.rstn(rstn),           		// Signals whether to re-start the current
                         			// program (rstn==0) or continue executing
                         			// the current program (rstn==1).
    	.outM(inM),       			// M value output
    	.writeM(writeM),          	// Write to M? 
    	.addressMR(addressR),    	// Address in data memory to Read(of M)
    	.addressMW(addressW),    	// Address in data memory to Write (of M)
    	.pc(pc)          			// address of next instruction
	);
	wire [15:0] pc;
	wire [15:0] instruction;
	wire [15:0] addressR;
	wire [15:0] addressW;
	wire [15:0] inM;
	wire writeM;
	// memory map
	localparam led_A =      16'b0010000000000000;		//8192
	localparam but_A =      16'b0010000000000001;		//8193
	localparam uart_tx_A =  16'b0010000000000010;		//8194
	localparam uart_rx_A =  16'b0010000000000011;		//8195
	localparam prom_addr_A =16'b0010000000000100;		//8196
	localparam prom_data_A =16'b0010000000000101;		//8197
	localparam boot_A =     16'b0010000000000110;		//8198

	reg [15:0] outM;	
	always @(*)
		begin
		outM = 0;
		if (addressR[15:13]==0) outM = ram[addressR[12:0]];
		else
			case (addressR)
				but_A: outM = {14'b00000000000000,but};
				led_A: outM = {14'b00000000000000,led};
				uart_tx_A: outM = (ready) ? 16'b1111111111111111 : 16'b0000000000000000;
				uart_rx_A: outM = data_rx;
				prom_addr_A: outM = sram_addr;
				prom_data_A: outM = sram_data;
			endcase
		end

	//RAM
	reg [15:0] ram [0:8191];
	always @(posedge clk)
		if (writeM & (addressW[15:13]==0)) ram[addressW] <= inM;

	// boot logic
	reg bootstart;
	always @(posedge clk)
		if (!rstn) bootstart<= 0;
		else if (writeM & (addressW == boot_A)) bootstart <= 1;
	
	reg [1:0] countdown;
	always @(posedge clk)
		if (!rstn) countdown <= 0;
		else if (bootstart) countdown <= countdown +1;
	
	reg bootn;	
	always @(posedge clk)
		if (!rstn) bootn <= 0;
		else if (countdown == 2) bootn <= 1;
		
	assign instruction = (!bootn) ? outROM : sram_data;
	assign sram_addr = (!bootn) ? prom_addr_r : {2'b00,pc};
	assign sram_data = (!bootn) ? prom_data : 16'bzzzzzzzzzzzzzzzz;
	assign sram_wen = (!bootn) ? prom_wen : 1;
	assign sram_oen = (!bootn) ? prom_oen : 0;
	assign sram_cen = (!bootn) ? prom_cen : 0;
	
	// bootloader on 64 x 16 Bit ROM
	reg [15:0] rom0 [0:3];
	reg [15:0] rom1 [0:3];
	reg [15:0] rom2 [0:3];
	reg [15:0] rom3 [0:3];
	reg [15:0] rom4 [0:3];
	reg [15:0] rom5 [0:3];
	reg [15:0] rom6 [0:3];
	reg [15:0] rom7 [0:3];
	reg [15:0] rom8 [0:3];
	reg [15:0] rom9 [0:3];
	reg [15:0] romA [0:3];
	reg [15:0] romB [0:3];
	reg [15:0] romC [0:3];
	reg [15:0] romD [0:3];
	reg [15:0] romE [0:3];
	reg [15:0] romF [0:3];
	always @(*)
		case (pc[5:2])
			0:	outROM=rom0[pc[1:0]];
			1:	outROM=rom1[pc[1:0]];
			2:	outROM=rom2[pc[1:0]];
			3:	outROM=rom3[pc[1:0]];
			4:	outROM=rom4[pc[1:0]];
			5:	outROM=rom5[pc[1:0]];
			6:	outROM=rom6[pc[1:0]];
			7:	outROM=rom7[pc[1:0]];
			8:	outROM=rom8[pc[1:0]];
			9:	outROM=rom9[pc[1:0]];
			10:	outROM=romA[pc[1:0]];
			11:	outROM=romB[pc[1:0]];
			12:	outROM=romC[pc[1:0]];
			13:	outROM=romD[pc[1:0]];
			14:	outROM=romE[pc[1:0]];
			15:	outROM=romF[pc[1:0]];
		endcase
	initial begin
		$readmemb("../../5_Assembler/boot/boot0.hack",rom0);
		$readmemb("../../5_Assembler/boot/boot1.hack",rom1);
		$readmemb("../../5_Assembler/boot/boot2.hack",rom2);
		$readmemb("../../5_Assembler/boot/boot3.hack",rom3);
		$readmemb("../../5_Assembler/boot/boot4.hack",rom4);
		$readmemb("../../5_Assembler/boot/boot5.hack",rom5);
		$readmemb("../../5_Assembler/boot/boot6.hack",rom6);
		$readmemb("../../5_Assembler/boot/boot7.hack",rom7);
		$readmemb("../../5_Assembler/boot/boot8.hack",rom8);
		$readmemb("../../5_Assembler/boot/boot9.hack",rom9);
		$readmemb("../../5_Assembler/boot/boota.hack",romA);
		$readmemb("../../5_Assembler/boot/bootb.hack",romB);
		$readmemb("../../5_Assembler/boot/bootc.hack",romC);
		$readmemb("../../5_Assembler/boot/bootd.hack",romD);
		$readmemb("../../5_Assembler/boot/boote.hack",romE);
		$readmemb("../../5_Assembler/boot/bootf.hack",romF);
	end
	reg [15:0] outROM;
	
	
	// leds	
	always @(posedge clk)
		if (!rstn) led <= 0;
		else if (writeM & (addressW==led_A)) led <= inM[1:0];

	// UART TX
	reg start;
	always @(posedge clk)
		if (!rstn) start<=0;
		else if (writeM & (addressW==uart_tx_A)) start <=1;
		else start <= 0;
	wire ready;
	uart_tx #(.BAUD(BAUD)) uart_tx(
		.clk(clk),
		.rstn(rstn),
		.start(start),
		.data(inM[7:0]),
		.tx(tx),
		.ready(ready)	
	);

	//UART RX
	wire rcv;
	reg [15:0] data_rx;
	wire [7:0] new_data_rx;
	always @(posedge clk)
		if (!rstn) data_rx <= 16'b1111111111111111;
		else if (rcv) begin 
			data_rx[7:0] <= new_data_rx[7:0];
			data_rx[15:8] <= 8'b00000000;
		end
		else if (writeM & (addressW==uart_rx_A)) data_rx <= inM;
	
	uart_rx #(.BAUD(BAUD)) uart_rx(
		.clk(clk),
		.rstn(rstn),
		.rx(rx),
		.rcv(rcv),
		.data(new_data_rx)
	);

	// Programm SRAM
	wire writeA;
	assign writeA = (writeM & (addressW==prom_addr_A));
	wire writeD;
	assign writeD = (writeM & (addressW==prom_data_A));

	wire [15:0] prom_addr_r;
	wire [15:0] prom_data_r;
	wire [17:0] prom_addr;
	wire [15:0] prom_data;
	wire prom_wen;
	wire prom_oen;
	wire prom_cen;
	prom prom(
		.in(inM),
		.clk(clk),
		.writeA(writeA),
		.writeD(writeD),
		.sram_data(prom_data_r),
		.sram_addr(prom_addr_r),
		.rstn(rstn),	
		.SRAM_addr(prom_addr),
		.SRAM_data(prom_data),
		.SRAM_wen(prom_wen),
		.SRAM_oen(prom_oen),
		.SRAM_cen(prom_cen)
	);

endmodule