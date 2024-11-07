# Level 5: Assembler
See nand2tetris chapter 6, on how to implement assembler for Hack language works. We will show some Assembler code used to test Hack-13 and its IO-Hardware. Finally we write bootloader in assembler.

##  Led (Assembler)
Hack cpu reads button state and switches led accordingly.
See Assembler code in  `5_Machine_Language/led/led.asm`:
```
(LOOP)
@8193		//read BUT
D=M

@8192		//write LED
M=D

@LOOP
0;JMP

```
Compile the code to `led.hack` with
```
$ make asm
```
**Note:** Last line in `led.hack` is empty. This is important, when uploading code with bootloader.

 
##  Echo (Assembler)
Hack cpu reads UART-RX and echoes to UART-TX.
```
(LOOP)
@8195		//read UART RX
D=M

@8194		//write UART TX
M=D

@LOOP
0;JMP

```

##  Buffer (Assembler)
Hack cpu reads UART-RX, buffers the data in SRAM and echoes to UART-TX.
```
(START)
@8196		//set address on SRAM
M=0

(LOOP)
(WAIT_RX) 	//WAIT for UART_RX
@8195
D=M
@WAIT_RX
D;JLT		

@8195		//clear uart_rx
M=-1

@8197		//store received data do SRAM
M=D

@8196		//increment address on SRAM
MD=M+1
@4
D=D-A

@LOOP
D;JNE

@8196		//set address to first address
M=0

(WAIT_TX)	//Wait for uart_tx ready
@8194
D=M
@WAIT_TX
D;JEQ

@8197		//write DATA to uart_tx
D=M
@8194
M=D

@8196		//increment SRAM address
MD=M+1
@4			//transmit 4 chars
D=D-A
@WAIT_TX
D;JNE

@START		//Jump to start
0;JMP
```

 
 
## Boot
`boot.asm` works as finite state machine. It detects characters '0', '1' and '\n'. State is shown on led of iCE40:
* state 00: run code in SRAM
* state 01: waiting for instruction
* state 10: writing instruction to SRAM
* state 11: error

FSM starts in state 01. When every thing is ok it will end at state 00, switching instruction execution to external Memory.

```
(LOOP)		
@8192		//state 01
M=1

@8196		//set PROM Address to 0
M=0

(NEXT)
@8197		//clear data
M=0

(WAIT_RX)	//Wait for char
@8195
D=M
@WAIT_RX
D;JLT

@8195		//clear rx-buffer
M=-1

@20			//char==\n ?
D=D-A
@CHAR_NL
D;JLE

@8192		//again in state 01
M=1

@28			//char==0 ?
D=D-A
@CHAR_0
D;JEQ

D=D-1		//char==1 ?
@CHAR_1
D;JEQ

@3
D=A
@8192		//error state = 3
M=D

(HALT)
@HALT		//next char
0;JMP

(CHAR_0)	//char 0
@8197
D=M
@8197
M=D+M
@WAIT_RX
0;JMP

(CHAR_1)	//char 1
@8197
D=M
M=D+M
M=M+1
@WAIT_RX
0;JMP

(CHAR_NL)	//char \n
@8196
M=M+1
@8192		//last char \n?
D=M-1
@CHAR_EOT
D;JNE
@8192		//last char is \n
M=M+1
@NEXT
0;JMP

(CHAR_EOT)
@8192		//LED 0 run
M=0
@8198		//jump to SRAM
AMD=0
0;JMP
```
To store bootloader on iCE40 without consuming BRAM we compile and partition the hack code in 4x1bit parts with:
```
$ cd 5_Assembler/boot
$ make asm
$ ./partition.py boot.hack
```
We end with 16 files called `boot0.hack`-`bootf.hack`, which are storedin permanently on iCE40.