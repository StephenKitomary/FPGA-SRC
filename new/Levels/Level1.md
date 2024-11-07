# Level 1: Wires
See [open-fpga-verilog-tutorial](https://github.com/Obijuan/open-fpga-verilog-tutorial/) project T01 and T02 on how to span wires in iCE40.

## Led (wires)
We will span a wire between the button [But1] and the led [Led1] of the iCE40 board, so we can light the led by pressing the button. The verilog code can be found in `1_Wires/led/led.v`:
```
//led.v
module led(but1,led1);
	input wire but1;
	output wire led1;
	assign led1 = but1;
endmodule

```
### Simulation
You also find a testbench `led_tb.v`, which simulates pressing but1. Use Makefile to run simulation.
```
$ cd 1_Wires/led
$ make sim
```
GTKWave opens and you can verify,that signal [led1] goes high in the same moment as [but1] goes high.
![](1_Wires/led/led1.png)
### Proof
Before uploading the code to iCE40, check that wires of [but1] and [led1] are mapped to the right pins of iCE40 by comparing `led.pcf` with schematic of board [iCE40HX8K-EVB](datasheets/iCE40HX8K-EVB_Rev_B.pdf).
```
// led.pcf
#set_io clk_in J3
set_io but1 K11
#set_io but2 P13
set_io led1 M12
#set_io led2 R16


```
Synthesize the verilog code and load it to iCE40, to proof that the [led1] can be controlled "really" by pressing [but1].
```
$ make prog
``` 
**Note:** Led will light, wenn button is released. This is because but1 is connected to iCE40 with pull-up resistor.
## Echo (wires)
In next project we want to send data from PC to iCE40 over UART. To check transmission we will setup iCE40 to echo UART data simply by spaning a wire between [RX-pin] and [TX-pin].
### Simulation
The testbench `echo_tb.v` simulates the transmission of a few characters to UART.
```
$ cd 1_Wires/Echo1
$ make sim
```
See the data on the lines.
![](1_Wires/echo/echo1.png)

### Proof
Synthesize and upload code to iCE40:
```
$ make prog
```
Press HWB on 32u4 to select UART-Bridge (green led on).

Open a UART-Terminal on your PC and see if iCE40 echos the transmitted characters:
```
$ screen /dev/ttyACM0 115200
```