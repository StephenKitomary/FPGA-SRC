# Level 7: High Level Language
We implement a Compiler for the High Level Language Jack as described in nand2tetris Chapter 9+10+11. To test the Jack Compiler on Hack-13 we rewrite Echo and Led in Jack.

## Led (Jack)
```
class Sys {

    function void init() {
		var Array mem;
		let mem = 8192;
		while(true){
			let mem[0] = mem[1];
		}
		return;
    }
   
}
```
### Proof
Set 32u4 as UART-Bridge, reset Hack-13. Compile and upload code:
```
$ cd 7_Jack_Compiler/led
$ make
```
Press but1, but2 and check leds.

## Echo (Jack)
```
class Sys {

    function void init() {
		while(true){
			do Sys.tx(Sys.rx());	//echo
		}
		return;
    }
   
	function int rx() {
		var int data;
		var Array mem;
		let mem = 0;
		let data = -1;
		while (data = (-1)){	//data recvd?
			let data=mem[8195];
		}
		let mem[8195]=-1;		//clear buffer
		return data;
   	}

   function void tx(int c){
		var boolean ready;
		var Array mem;
		let mem=0;
		let ready = false;
		while (ready = (false)) {	//tx ready
			let ready = mem[8194];
		}
      	let mem[8194] = c;			//send char
		return;
   }

}

```
### Proof
Set 32u4 as UART-Bridge. Reset Hack-13. Upload code and check if Hack-13 answers
```
$ cd 7_Jack_Compiler/led
$ make
$ screen /dev/ttyACM0
```