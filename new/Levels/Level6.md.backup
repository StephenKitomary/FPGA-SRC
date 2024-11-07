# Level 6: Virtual Machine
Assembler language is still very limitated. We implement a stack based Virtualmachine as described in [nand2tetris](https://nand2tetris.org) chapter 7+8.

To test the Virtual Machine we have to rewrite some code.

## Led (VM)

```
function Sys.init 0		//VM calls Sys.init

push constant 8192		//set pointer to GPIO memory
pop pointer 0

label LOOP

push this 1				//push but status to stack
pop this 0				//write last stack element to led

goto LOOP				//repeat

```
Translate the VM-Code to Hack and upload with bootloader to Hack-13:

```
$ make
```
## Echo (VM)
Let's see if we can do calls to subroutines. We split Echo code in to VM-"classes":

```
// Sys.vm
function Sys.init 0

	label WHILE
	call UART.rx 0
	call UART.tx 1	
	pop temp 0
	goto WHILE

```
Remember first call of VM goes to Sys.init!
```
// UART.vm
function UART.rx 1
	label WAIT_RX
	push constant 8195
	pop pointer 0
	push this 0
	pop local 0
	push local 0
	push constant 1
	neg
	eq
	if-goto WAIT_RX

	push constant 1
	neg
	pop this 0
	
	push local 0
	return

function UART.tx 0
	label WAIT_TX
	push constant 8194
	pop pointer 0
	push this 0
	not
	if-goto WAIT_TX
	
	push argument 0
	pop this 0
	push constant 0
	return 

```
Compile and upload with:

```
$ make
```
Switch 32u4 to UART by pressing HWB. Then open UART Terminal and see if iCE40 with Hack-VM! is echoing.
```
$ screen /dec/ttyACM0 115200
```


