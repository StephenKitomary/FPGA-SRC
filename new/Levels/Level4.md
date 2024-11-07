# Level 4: Computer Architecture
We will implement Hack in verilog as described in [nand2tetris](https://nand2tetris.org) course chapter 5. The main difference to the original Hack is, that we have to invent "real" I/O Hardware to which Hack can talk to. We do this in several steps:

## Hack-1 (GPIO)
Hack-1 features minimal I/O to be tested in real hardware.
Programms are stored in 1024x16bit ROM implemented as BRAM in iCE40. RAM is 1024x16 bit RAM (implemented as BRAM on iCE40). Led and Button are accessible with memory map:

|RAM|R/W|I/O|
|-|-|-|
|0-1023|R/W|general purose RAM|
|8192|R/W|LED (2bits)|
|8193|R|Button (2bits)|

**Note:** Original Hack runs 1 Instruction per cycle. Our implementation needs 2 cycles for A-Instruction and 3 cycles for C-Instruction.

In our first test of Hack-1 we read button state and switch led accordingly. Assembler code is given in [Level 5: Assembler]().
### Simulation
Start simulation with:
```
cd 4_Computer_Architecture/hack-1
make sim
```
and see how led signal follows but signal. It's not instant, because cpu has to read button and to write to led register. 

![](4_Computer_Architecture/hack-1-gpio/hack1a.png)

Inspect cpu signal in detail to see, that it takes minimum of 15 cycles.
![](4_Computer_Architecture/hack-1-gpio/hack1b.png)

### Proof
We synthesize and upload code to iCE40.
```
make prog
```
Push button and look at leds. Looks like a simple wire between but and led. But what really happens is magic!

## Hack-2 (UART)
Let's see, if we can talk to Hack-2, which has UART mapped to memory:

|Address|R/W|I/O|
|-|-|-|
|8194|R|Read status of UART-TX: -1 = ready, 0 = busy|
|8194|W|Send character UART-TX|
|8195|R|Read status of UART-RX: -1 = nothing, 0..255 = received char|
|8195|W|Write -1 to clear UART-RX buffer|

Hack-2 runs assembler code `echo.asm`, see [Level 5: Assembler]().
### Simulation
See how Hack-2 echoes UART-RX to UART-TX.
![](4_Computer_Architecture/hack-2-uart/hack2a.png)

Dig to the cpu signals and notice 3 writeM spikes:
1. write received char to Memory RAM
2. write -1 to UART-RX (clear buffer)
3. write char to UART-TX
![](4_Computer_Architecture/hack-2-uart/hack2b.png)

### Proof
Start Hack-2 with:
```
$ make prog
(set 32u4 to UART-Bridge)
$ screen /dev/ttyACM0
```
And type some chars to see Hack echoing.

## Hack-3 (SRAM)
With our third model Hack-3 we will try to read/write to external SRAM-chip. We add verilog module `prom.v` which controlles timing of read/write cycle as described in [datasheet of SRAM](0_Requirements/datasheets/K6R4016V1D-TC10.pdf) and map to RAM at address:

|Address|R/W|I/O|
|-|-|-|
|8196|R/W|SRAM-Address holds the address of external SRAM for next read/write operation|
|8197|R/W|SRAM-Data read/write from/to SRAM at address in mem[8196]|

Hack-3 runs `buffer.asm` which reads 4 chars from UART-RX, stores them in the external SRAM, and finally echoes the 4-char-String.
### Simulation
You can see 4 how 4 bytes are bufferd. The TX- signal is schown in red (unnogn signal) because simulation does not know what external SRAM spits out.
![](4_Computer_Architecture/hack-3-sram/hack3a.png)
We inspect the detail to check write timing.
![](4_Computer_Architecture/hack-3-sram/hack3c.png)

### Proof
```
$ make prog
(switch 32u4 to UART-Bridge)
$ screen /dev/ttyACM0
```
End see if it works in real.
## Hack-4 (Boot)
So far the computer runs machine language stored in the iCE40 BRAM. This is very limited in space. So we want to use external SRAM (512k x 16Bit) to store programm. We write little bootloader `boot.asm` and store the binary in 16 partitions to ROM made of Registers. So we can use whole BRAM of 8Kx16 Bit for Hack RAM. We add bootlogic to Hack and map it to Memory:

|Address|R/W|I/O|
|-|-|-|
|8198|W|Write to switch execution memory from ROM  to SRAM|

The bootloader works as Finite State Machine. It handels '0', '1' and '\n' as input chars. The actual state is shown the leds of iCE40 board. With the last Assembler instructions in `boot.asm` we switch from ROM execution to PROM execucution. See [5_Assembler]() to see the whole bootloader code.
```
@8198		//set address to bootlogic
AMD=0		//clear all register and activate countdown of boot logic
0;JMP		//jump to address 0 of PROM
```

### Simulation
See the hack code loading to PROM.
```
11\n	(write to PROM)
101\n	(write to PROM)
111\n	(write to PROM)
\n 		(jump to PROM address 0)
```
![](4_Computer_Architecture/hack-4-boot/hack4a.png)
We inspect the detail of the boot logic and see the countdown handling execution to external SRAM.
![](4_Computer_Architecture/hack-4-boot/hack4b.png)

### Proof
```
$ cd 4_Computer_Architecture/hack4-boot
$ make prog
(set 32u4 to UART-Bridge)
$ screen /dev/ttyACM0
```
Enter Binary code of `led.hack` in terminal:
```
0010000000000001	(after \n you should see led: 10)
1111110000010000
0010000000000000
1110001100001000
0000000000000000
1110101010000111
					(enter empty line: led programm should run)

```

We can now easily upload hack code to iCE40. 32u4 must be set as UART_Bridge. Reset iCE40 and see status led 01=wait for code. Then upload code with:
```
$ cat <code.hack> > /dev/ttyACM0
```
Status led should turn off and programm starts execution.

## Hack-5 (Screen)
Skip this section on first reading. Come back after Level-9 Operating System, where we implement driver for LCD screen.

|Address|R/W|I/O|
|-|-|-|
|8200|R|read status of SPI: -1 = ready, 0 = busy|
|8200|W|Send 8 bit command to Screen via SPI|
|8201|W|Send 8 bit data to screen over SPI|
|8202|W|Send 16 bit data to screen over SPI|

## Hack-13 (final)
Left as an exercise to add more Hardware:

* sound
* sd-card
* ..