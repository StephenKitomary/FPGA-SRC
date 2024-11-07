# Level 9: Application
We arrived at the application level of Hack-13. We will implement some applictation in JACK using OS-services.
Run Makefiles to Compile Jack application and upload to Hack-13.

**Note:** 32u4 must be in mode UART-Bridge.
## Fibonacci
Calculate Fibonacci-series and display on screen. Let's see how Hack-13 handles recursion.
```
class Main{

	function void main(){
		var int n;
		var String s1,s2;
		let s1 = "Fib(";
		let s2 = ")=";
		let n=1;
		while (n<24){
			do Output.printString(s1);
			do Output.printInt(n);
			do Output.printString(s2);
			do Output.printInt(Main.fib(n));
			do Output.println();
			let n=n+1;
		}
		return;
	}

	function int fib(int n){
		if (n<3){
			return 1;
		}
		return Main.fib(n-1)+Main.fib(n-2);
	}
}

```
Compile and download to Hack-13 with:
```
$ cd 9_Application/Fibonacci
$ make
```
### Prof
![](9_Application/fibonacci/fibonacci.JPG)

## Average
Original JACK application from nand2tetris course runs without modifications.
```
$ cd 9_Application/Average
$ make
```
### Prof
![](9_Application/average/average.JPG)


## Pong
Mostly identic to original from nand2tetris course. Just changed parameters for screen size.
```
$ cd 9_Application/Pong
$ make
```
**Note:** Due to Assembler not (yet) implementing jumps to memory address >32768 Operating System is reduced (no Keyboard.jack, no Math.Sqrt, no Screen.circle). Controll paddle with But1 and But2.
### Prof
![](9_Application/pong/pong.png)


## Tetris
Left as an exercise.
