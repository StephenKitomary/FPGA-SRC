# Level 0: Requirement
## Hardware

```
        +----------------+      +-----------------+     +---------+
    USB | olimexino-32u4 | UEXT | iCE40-HX8K-EVB  | SPI | 2.8"LCD |
PC <===>|                |<====>| 512Kx16bit SRAM |<===>| 320x240 |
        +----------------+      +-----------------+     +---------+
```

### iCE40HX8-EVB Board (iCE40)

This project is based on the iCE40-fpga from lattice. iCE40 has the advantage of beeing programmable with free and open source toolchain. We use [iCE40HX8K-EVB](https://www.olimex.com/Products/FPGA/iCE40/) from Olimex. It comes with 512Kx16bit of external SRAM, which will be used as ROM to store hack-code.


### Olimexino-32u4 (32u4)

[Olimexino-32u4](https://www.olimex.com/Products/Duino/AVR/OLIMEXINO-32U4/open-source-hardware) is an arduino-leonardo-like board. It connects iCE40 to a computer via USB. Press the HWB-Button on 32u4 to switch between the modes:
1. programmer: uploads compiled verilog code to iCE40 (yellow led on).
2. UART-Bridge: talk to fpga (green led on).

### Screen

Hack-13 will drive [MOD-LCD2.8RTP](https://www.olimex.com/Products/Modules/LCD/MOD-LCD2-8RTP), a 2.8 Inch LCD color screen with 320x240 Pixel based on ILI9341V-controller, which has the nice protperty of beeing very well documented.

### Don't forget
* CABLE-IDC10-15cm: connects 32u4 to iCE40
* mini-USB: connects 32u4 to your PC
* Jumper wires: connects iCE40 to Screen
* 5V power supply
* little rubber feets to hold boards

## Software
### Project IceStorm
This project uses toolchain [Project IceStorm](http://www.clifford.at/icestorm/) from Clifford Wolf to program iCE40 FPGA.
#### Install dependencies
```
sudo apt-get install build-essential clang bison flex
	libreadline-dev gawk tcl-dev libffi-dev git mercurial
	graphviz xdot pkg-config python python3 libftdi-dev
	qt5-default python3-dev libboost-all-dev cmake
```
#### Install IceStorm Tools (icepack,icebox,iceprog,icetime,chip databases)
```
git clone https://github.com/cliffordwolf/icestorm.git icestorm
cd icestorm
make -j$(nproc)
sudo make install
```

#### Install NextPNR (place&route tool)
```
git clone https://github.com/YosysHQ/nextpnr nextpnr
cd nextpnr
cmake -DARCH=ice40 -DCMAKE_INSTALL_PREFIX=/usr/local .
make -j$(nproc)
sudo make install
```
#### Install Yosys (Verilog synthesis)
```
git clone https://github.com/cliffordwolf/yosys.git yosys
cd yosys
make -j$(nproc)
sudo make install
```
#### Install Icarus Verilog and GTKWave
```
sudo apt-get install gtkwave iverilog
```
### Olimexino-32u4 as programmer for iCE40

See install instructions on [get started under Linux (Olimex)](https://www.olimex.com/wiki/ICE40HX1K-EVB#Get_started_under_Linux).
#### Install iceprogduino
```
git clone https://github.com/iCE40HX1K-EVB/ 
cd icestorm/iceprogduino
make clean
make
make install
```
#### Download firmware to 32u4
To use olimexino-32u4 as programmer for iCE40, you have to upload firmware.
The firmware can be uploaded via Arduino IDE. To compile it use SPIFlash 2.2.0 library for 
Winbond Flash Memory by Prajwal Bhattaram - Marzogh.

**Note:** We use modified sketch `nand2tetris-13/olimexino-32u4\ firmware/iceprog_bridge`, which has support for UART-Bridge. Press HWB to toggle between:
1. programmer-mode (yellow led)
2. UART-Bridge (green led)

## Skills
### nand2tetris
Work through [nand2tetris](https://nand2tetris.org) and build Hack and the tools (Assembler, Virtual Machine, Jackcompiler and Operating System)

### Verilog
Lern some verilog: See [open-fpga-verilog-tutorial](https://github.com/Obijuan/open-fpga-verilog-tutorial/) for a nice tutorial.
