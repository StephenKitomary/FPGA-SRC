# nand2tetris-13

> ... _Would'nt it be nice to make Hack or Jack also run on some "real platform," made from some "real stuff"?_ ... 
>
---Noam Nisan and Shimon Schocken

This project is about building Hack on real hardware as proposed in Chapter 13 of the course [nand2tetris](https://www.nand2tetris.org/) using free and open source hard- and software. 

The project consists of 9 Levels, starting with simple wires and ending at Hack-13, the final implementation of Hack on iCE40 FPGA running JACK compiled code at 100 MHz with 8Kx16bit RAM, 64Kx16Bit PROM, a bootloader to upload programms and a 2.8 Inch Color LCD with 320x240 Pixel.

Finally we will discuss, if Hack-13 is powerfull enough to run serious Jack-Application like Pong and Tetris!?
![](9_Application/pong/pong.png)

## Enter the Matrix
>_... This is your last chance. After this, there is no turning back. You take the blue pill — the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill — you stay in Wonderland and I show you how deep the rabbit-hole goes. ..._
>
> ---Morpheus

### [Level 0: Requirement](Levels/Level0.md)
### [Level 1: Wires](Levels/Level1.md)
### [Level 2: Combinatorial Logic](Levels/Level2.md)
### [Level 3: Sequential Logic](Levels/Level3.md)
### [Level 4: Computer Architecture](Levels/Level4.md)
### [Level 5: Assembler](Levels/Level5.md)
### [Level 6: Virtual Machine](Levels/Level6.md)
### [Level 7: High Level Language](Levels/Level7.md)
### [Level 8: Operating System](Levels/Level8.md)
### [Level 9: Application](Levels/Level9.md)

## Credits

* Noam Nisan and Shimon Schocken: Visit [nand2tetris](https://nand2tetris.org) and learn to build a modern general-purpose computer system from ground up.
* Juan Gonzalez-Gomez (Obijuan): Lern verilog with [open-fpga-verilog-tutorial](https://github.com/Obijuan/open-fpga-verilog-tutorial/), best tutorial!
* [Olimex Ltd](https://www.olimex.com/): Buy your hardware from the Company with highest number of registered OSHW projects :)
* Wolf Clifford: The master of open source FPGA with iCE40 and  [Project IceStorm](http://www.clifford.at/icestorm/)
