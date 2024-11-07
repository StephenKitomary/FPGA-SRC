nand2tetris-iCE40
is implementation of nand2tetris on iCE40-HX8-EVB (Olimex)

CPU: runs binary code of nand2tetris
     2 cycles for A-Instruction
     3 cycles for I-Instruction

RAM: 8K x 16Bit (instead of 32K x 16 Bit)
     Implemented on BRAM of iCE40

ROM: 64K x 16 Bit (instead of 32K x 16 Bit)
     Implemented on external SRAM
     Programmed via bootloader (stored in 64 x 16 Bit Register of iCE40)

Memory Mapped IO:
UART: 115200 Baud accessible over memory map
      Addr: 8192 write data to be transmitted, read (0 busy, -1 ready)
      Addr: 8193 read received data from buffer, or -1 if no data available
      Addr: 8193 write -1 to clear buffer
     
LED: 2 leds on iCE40HX8-EVB Board
     Addr: 8194 write 1 led1 on, or 0 led1 off
     Addr: 8195 write 1 led2 on, or 0 led2 off

BUT: 2 Buttons on iCE40HX8-EVB Board
     Addr: 8196 read 0 but1 pressed, -1 but1 released
     Addr: 8197 read 0 but2 pressed, -1 but2 released

PROM: Write Data to external SRAM, used in bootloader to store programm
      Addr: 8198 holds external Address of SRAM to write or read next data
      Addr: 8199 read/write data from/to external SRAM at Address (@8198)

BOOT: This Register is start execution of program stored in external SRAM (PROM)
      Addr: 8200 write any data and programmmemory will swap to external SRAM after 2 cycles.
      Usage: In boot.asm after writing program to SRAM:
             @8200
             M=0     //switch memory from internal ROM to PROM (external SRAM)
             @0
             0;JMP   //and jump to first address

Real Hardware iCE40 Evaluation Board from Olimex:
  iCE40HX8-EVB from Olimex
   |-iCE50HX8 fpga
   |-SRAM 256K * 16Bit (stores the programm of HACK)
   |-UEXT Connector connected to Olimexino 32u4
      |- mode Programm = download fpga-binary to iCE40
      +- mode UART = talk to HACK
   |-led1, led2
   +-but1, but2

Instruction to run blink on hack (synthesized on iC40):
1. compile hack.v and programm to iCE40
   use Olimexino 32u4 as programmer (iceprogduino) yellow led on
   make prog

2. iCE40 runs hack in bootmode (bootloade stored in rom on iCE40)
   led1 is on = bootloader waits for hackbinary
   led2 is on = error on upload

3. send hackbinary to iCE40
   use Olimexino 32u4 as UART-Bridge (press HWB) green LED on Olimexino
   cat blink.hack > /dev/ttyACM0

4. iCE40 runs hack
   hack runs programm in PROM (external SRAM)
   led1 is blinking.

CPU-Timing
-----------------------------------------------------------------------
clk      0  |1  |0  |1  |0  |1  |0  |1  |0  |1  |0  |1  |0   |1 
-----------------------------------------------------------------------
rstn     0  |1
-----------------------------------------------------------------------
state       |FETCH  |EXEC   |FETCH  |EXEC    |JMP   |FETCH   |
-----------------------------------------------------------------------
PC          |0              |1                      |18               
-----------------------------------------------------------------------
Instruction |       |@17            |AMD=A+1;JNZ             |         
-----------------------------------------------------------------------
RegAn                                               |18
----------------------------------------------------------------------
RegA        |0              |17                             |18
-----------------------------------------------------------------------
RegD        |0              |                |18
-----------------------------------------------------------------------
InM                         |M[0]
-----------------------------------------------------------------------
outM                                         |18
-----------------------------------------------------------------------
JMP         |0                               |1
-----------------------------------------------------------------------
writeM      |0                               |1    |0
-----------------------------------------------------------------------

