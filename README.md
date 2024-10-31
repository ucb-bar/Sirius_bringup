# Cygnus bringup

This project serves as PCB bringup for the Cygnus chip taped-out in 2024 Q2. The Cygnus chip is a pair of 4x4 $mm^2$ chiplets on the same package on a 16nm process. The chip is designed to be a low-power, high-performance chip for DSP computing applications, and to showcase scalability of the chiplet architecture for future AI applications.

## Timeline
### Oct 25, PCB kickoff
![Overall structure](./imgs/overall_structure.jpeg)
![Power and stack](./imgs/power_stack.jpeg)

## Test plan

## PCB Considerations
1. No high speed signals on Q2 chip
2. SerialTL interface
3. Testpoints
4. DDR considerations
5. Power Supply # Cygnus-Bringup

## PCB

[Altium 365](https://ucb-bar.365.altium.com/designs/48DF959B-C662-42B1-99D3-1AA11DF22FD2#design)


## To Be Confirmed

 - [ ] reset polarity
 - [ ] VDD_DDR voltage level



## Bringup FPGA

[Digilent Nexys Video](https://digilent.com/shop/nexys-video-artix-7-fpga-trainer-board-for-multimedia-applications/)

- $550
- Artix 7
- USB-UART / Ethernet / FT2232 (FTDI USB-FIFO chip, kind of an old part with iffy drivers)
- 512 MiB DDR3
- FMC-LPC (ASP-134603-01), 34x2 pins, Vadj set to 1.2V by default, easy
- Used by Maveric Bringup


## Schematic

### Power and Clock

#### Digital Supply (VDD_D)

0.85 V, generated by bench power supply through banana connector

#### IO (VDD_IO)

1.2 V, generated by bench power supply through banana connector

#### DDR Power (VDD_DDR)

vddh_q4 is special, and is allocated for DDR power.

#### Ground

single ground shorted together


#### Core clock (CLK, clock 1_24)

100 MHz nominal slow clock, driven by external clock generator.

1.2 Vpp

50 Ohm impedance

#### PLL refclk (PLL_CLK, refclk 1_28)**

100 MHz nominal input, 1.2 Vpp



### IO Signals

#### Chip Reset

Chip reset is active high (TODO: confirm this)

Reset connect to button, no need for header pin since we haven't use this feature in previous bringups.

#### JTAG

Low priority low speed signal, route to pin header

#### 



### Test Circuit

Decide to allocate a small portion of PCB area to test circuit. This is used to verify the level shifter and other IC selections for future board designs.

Except for power domain, this circuit is isolated to the core circuitry.



## PCB Layout

8 layer PCBs

| Index | Layer Name | Material | Thickness | Purpose    |
| ----- | ---------- | -------- | --------- | ---------- |
| 1     | Top        |          |           | Signal     |
| 2     | In1        |          |           | GND        |
| 3     | In2        |          |           | Signal     |
| 4     | In3        |          |           | VDD_D      |
| 5     | In4        |          |           | Other VDDs |
| 6     | In5        |          |           | Signal     |
| 7     | In6        |          |           | GND        |
| 8     | Bottom     |          |           | Signal     |



Layout will be done in millimeters (mm)



