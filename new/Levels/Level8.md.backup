# Level 9: Operating System

We will implement the Operating System in the JACK language as proposed in nand2tetris chapter 12 to fit Hack-13 and its IO-Hardware. We provide Testclasses for every OS-Class. To compile and run testclass just:
```
$ cd <OS-Service>Test.jack
$ make
```
## GPIO.jack
Provides access to buttons and leds. The test class to connect but with led translates to:
```
class Sys{
	// Sys.init() is the first function executed by the VM
	function void init(){
		do GPIO.init();
		var boolean state;
		while (true){
			let state=GPIO.getBut(0);
			do GPIO.setLed(0,state);
		}
	}
	return;
}
```
## UART.jack
Provides access to UART-RX and UART-TX. ECHO translates to:
```
class Main(){
	function void main(){
		var char c;
		while (true){
			let c = UART.rx();
			do UART.transmit(c);
		}
	}
	return;
}

```
**Note:** Main.main() is called from Sys.init()!
## Memory.jack
We can now buffer UART-Data to Memory with peek and poke.
```
while (true){
	let i=0;
	while (i<10){
		do Memory.poke(3000+i,UART.rx());
		let i=i+1;
	}
	let i=0;
	while (i<10){
		do UART.tx(Memory.peek(3000+i);
		let i=i+1;
	}
}
```
## Array.jack
Go object oriented and store the buffered UART data in an array-object:
```
while (true){
	let r = Array.new(10);
	let i=0;
	while (i<10){
		let r[i]=UART.rx();
		let i=i+1;
	}
	let i=0;
	while (i<10){
		do UART.tx(r[i]);
		let i=i+1;
	}
	do r.dispose();
}

```
## Math.jack + String.jack
Till now the Hack-13 couldn't perform multiplication!! Time to implement Math.jack which is used by String.jack to perform conversion between Int and String. Now we can store data in Strings and even convert to Integer. Look if hack can calculate squareroots in StringTest.jack:
```
var String s;
var int n;

let s = UART.input();
let n = s.intValue();
let n = Math.sqrt(n);
do s.setInt(n);
do UART.println(s);
```
## Screen.jack
Consult datasheet of ILI9341 to see what commands has to be sent to SPI Interface in order to draw on the screen.
![](8_Operating_System/ScreenTest/screen.JPG)

## Output.jack
This class provides bitmaps to print characters on the screen.
![](8_Operating_System/OutputTest/output.JPG)


## Keyboard.jack
Wrapper class to use UART as keyboard.
```
$ screen /dev/ttyACM0
```
And use terminal as Keyboard.
## Sys.jack
VM starts Sys.init() which initialises the whole Operating System and then calls Main.main(). We can now implement BLINK using the wait-function:
```
while(true){ 
	do Sys.wait(1000);
	do GPIO.setLed(GPIO.getLed()+1);
}

```
