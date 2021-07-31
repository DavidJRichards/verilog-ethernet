# Verilog Ethernet Wukong Example Design

## Introduction

This example design targets the Qmtech XC7A100T Wukong FPGA board.

The design by default listens to UDP port 1234 at IP address 192.168.178.130 and
will echo back any packets received.  The design will also respond correctly
to ARP requests.  

No specific board configuration required

*  FPGA: xc7a100tfgg676-2
*  PHY: Realtek RTL8211EG

## How to build

Project was copied from KC705, make run, and resulting project changed in Vivado IDE.
This source directory is a copy of the resulting working system

Run make to build.  Ensure that the Xilinx Vivado toolchain components are
in PATH.

```
david@I7MINT:~/Github/verilog-ethernet/example/Wukong/fpga$ cd /home/david/Github/verilog-ethernet/example/Wukong/fpga/
david@I7MINT:~/Github/verilog-ethernet/example/Wukong/fpga$ source /opt/Xilinx/Vivado/2020.2/.settings64-Vivado.sh

```

make has ben amended to use openocd to program the Artix, the required configuration files are included. make program programs the board using a USB FT2232 device connected to the JTAG port.

```
	openocd -f Wukong.cfg -c "pld load 0 fpga/fpga.bit; exit"
```

## How to test

Run make program to program the KC705 board with Vivado.

Then run

    netcat -u 192.168.178.130 1234

to open a UDP connection to port 1234.  Any text entered into netcat will be
echoed back after pressing enter.

It is also possible to use hping to test the design by running

    hping3 192.168.178.130 -2 -p 1234 -d 1024

