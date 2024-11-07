`default_nettype none
`include "baudgen.vh"

module hack(						//Olimex iCEHX8-EVB
    input wire clk,					//clock 100 MHz	
    input wire [1:0] but,			//buttons	(0 if pressed, 1 if released)
	output reg [1:0] led,			//leds 		(0 off, 1 on)
	output wire tx,					//UART TX on UEXT-Connector
	input wire rx					//UART RX on UEXT-Connector
);
	
	// ROM file of hack
	parameter ROMFILE = "../../5_Assembler/echo/echo.hack";
	
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
			endcase
		end
	

	//RAM
	reg [15:0] ram [0:1023];
	always @(posedge clk)
		if (writeM & (addressW[15:13]==0)) ram[addressW] <= inM;

	//ROM		
	reg [15:0] rom [0:1023];
	assign instruction = rom[pc];
	initial begin
		$readmemb(ROMFILE,rom);
	end
	
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

endmodule
