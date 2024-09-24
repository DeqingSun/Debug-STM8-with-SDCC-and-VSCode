# Debug STM8 with SDCC and VSCode

This is a minimal example of using VSCode to debug STM8 micro-controller with SDCC compiler. 

![Debugging in VSCode](https://raw.githubusercontent.com/DeqingSun/Debug-STM8-with-SDCC-and-VSCode/main/img/openocd.jpg)

The setup has been tested on:

| Host OS        | VSCode  | SDCC    | OpenOCD | stm8binutils | Debug Probe | Target |
| --------       | ------- | ------- | ------- | ------- | ------- | ------- |
| Mac OS 11.7.10 | 1.92.2  | [Snapshot 20240827-14976](https://sdcc.sourceforge.net/snap.php) | [v0.12.0-4](https://github.com/xpack-dev-tools/openocd-xpack/releases) | [0.230.0](https://sourceforge.net/projects/platformio-storage/files/packages/) | [Cheap ST-Link V2 Clone](https://www.adafruit.com/product/2548) | STM8L101F3U6

## Introduction

STM8 uses a SWIM pin for both programming and debugging. As long as you can program the STM8 chip, you should be able to do debugging without any modification on the hardware side. 

This project uses the SDCC compiler to generate ELF files, OpenOCD as the debug server, stm8-gdb as the debugger, and VSCode as the IDE. This project also tried to minimize dependencies by not using a framework. 

The binary file of all tools can be found in the "tested "table.

## how to use this example


## Reference

[https://github.com/hbend1li/stm8_started](https://gist.github.com/TG9541/79aa3bb1a56a8220eac8f57ab21302e1)

[https://gist.github.com/TG9541/79aa3bb1a56a8220eac8f57ab21302e1](https://gist.github.com/TG9541/79aa3bb1a56a8220eac8f57ab21302e1)

   
