# Level 2: Combinatorial logic
## Nand
We put some logic between input [but] and output [led]. Nand can be implemented as logic primitive in verilog:
```
// Nand.v
module Nand(a,b, out);
  input wire a;
  input wire b;
  output wire out;
  
  nand(out,a,b);
endmodule


```
### Simulation
Run the simulation:
```
$ cd 2_Combinatorial_logic/Nand
$ make sim
```
Compare the output `Nand.out` with `Nand.cmp` to verify the logic:

|   a   |   b   |  out  |
|-------|-------|-------|
|   0   |   0   |   1   |
|   0   |   1   |   1   |
|   1   |   0   |   1   |
|   1   |   1   |   0   |


### Proof
Synthesize the code, upload it to iCE40, and check if logic works by pressing but1 (n)and but2.
```
$ make prog
```
**Note:** Due to pull-up resistor logic will look like Or!?
## Addition 1+1=10
Take some nands and build a Halfadder to calculate but1+but2 and output the sum to led in binary representation.
### Simulation
```
cd 2_Combinatorial_logic/Add1
make sim
```
![](2_Combinatory_logic/Add1/Add1.png)
Compare the output file `HA.out` with `HA.cmp` to verify the addition logic works:

|   a   |   b   |  out  |
|-------|-------|-------|
|   0   |   0   |  00   |
|   0   |   1   |  01   |
|   1   |   0   |  01   |
|   1   |   1   |  10   |
### Proof
```
$ cd 2_Combinatorial_logic/Add1
$ make prog
```
**Note** Before synthesizing and uploading to iCE40 place Not gates between but1/but2 and And-Gate to resolve issue due to pull-up resistors.

## Arithmetic and Logic Unit (ALU)
Build the ALU of Hack in verilog. See nand2tetris chapter 3 for details. Simulate some inputs and compare `alu.out` with `alu.cmp` to verify proper working.
```
$ cd 2_Combinatorial_logic/ALU
$ make sim
$ cat alu.out
```
: