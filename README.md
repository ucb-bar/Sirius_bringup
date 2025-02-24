# Sirius bringup

This project serves as PCB bringup for the Sirius chip taped-out in 2024 Q3, Intel16 USP. Sirius (binary star) is a pair of 4x4 $mm^2$ chiplets on the same package . The chip is designed to be a high-performance platform for AI/ML computing applications, and to showcase scalability of the chiplet architecture and interconnect capability for future AI applications.


## Links

[G Drive](https://drive.google.com/drive/folders/1GL_Q8HkU-XlZhugEkRs6XLr12FDdKcfK?usp=drive_link)
[Altium 365](https://ucb-bar.365.altium.com/designs/23BB8F26-26F5-4939-8407-A4EF6E1FDC51)


## PCB Timeline

| Task                                | Start Date  | Duration       |
| ----------------------------------- | ----------- | -------------- |
| Forking from Cygnus and pin remapping | 2025-1-26 | -  |
| Schematic checking | 2025-2-4 | morning |
| Design review resolve conflict | 2025-02-21 |  |


## Bringup FPGA

2x [Digilent Nexys Video](https://digilent.com/shop/nexys-video-artix-7-fpga-trainer-board-for-multimedia-applications/)

- $550
- Artix 7
- USB-UART / Ethernet / FT2232 (FTDI USB-FIFO chip, kind of an old part with iffy drivers)
- 512 MiB DDR3
- FMC-LPC (ASP-134603-01), 34x2 pins, Vadj set to 1.2V by default, easy
- Used by Maveric Bringup
- One for each chiplet


## Chiplet-to-Socket Mapping

- Q3 of the socket corresponds to the Golden Triangle (Pin 1 mark)
- Socket quandrant order should look identical as U1

| Socket | Chip     |
| ------ | -------- |
| Q1     | U2 Q3+Q4 |
| Q2     | U1 Q1+Q2 |
| Q3     | U2 Q1+Q2 |
| Q4     | U1 Q3+Q4 |

<img width="656" alt="Screenshot 2024-11-14 101738" src="https://github.com/user-attachments/assets/aadf6c1f-8a82-4fb5-a993-d0a8376d9504">



## Schematic

### Power

| Net          |  Signal Name              | Description              |
| ------------ | ------------------------- | ------------------------ |
| VDD_IO       | IO cell supply            | 1.2 V                    |
| VDD_U1       | Chiplet 1 digital supply  | 0.85 V nominal           |
| VDD_U2       | Chiplet 2 digital supply  | 0.85 V nominal           |
| VDD_UCIE_U1  | Chiplet 1 digital supply  | 0.85 V nominal           |
| VDD_UCIE_U2  | Chiplet 2 digital supply  | 0.85 V nominal           |
| VDD_PRE_U1   | Chiplet 1 DDR precharge supply | expected 0.6 V      |
| VDDQ_U1      | Chiplet 1 DDR PHY supply  | expected 1.2 V           |
| DLL_VINIT_U1 | Chiplet 1 DLL backup supply | boot the DLL in a) case of jumpstarting DLL locking due to false lock conditions and b) booting DLL in case of total system failure |
| DLL_IBIAS_MAIN_U1 | Chiplet 1 DLL analog bias current | This bump is used to supply a bias current to all the circuits in the analog section |
| VDD_PRE_U2   | Chiplet 2 backup DDR precharge supply | expected 0.6 V |
| VDDQ_U2      | Chiplet 2 backup DDR PHY supply | expected 1.2 V     |
| GND          | Ground                    | Single ground shorted together |

### Clocking

**Core clock (clock_u1, clock_u2)**

- 100 MHz nominal slow clock, driven by external clock generator.
- 1.2 Vpp
- 50 Ohm impedance
- 50R termination resistor near chip socket
- feed in through SMA connector

**PLL refclk (pll_refclk_u1, pll_refclk_u2)**

- 100 MHz nominal input, 1.2 Vpp
- 1.2 Vpp
- 50 Ohm impedance
- 50R termination resistor near chip socket
- feed in through SMA connector

**Debug clock (clk_debug_u1, clk_debug_u1)**

- PLL tap debug clock out, can be muxed to output other clocks
- feed out through SMA.

**UCIe clock**

- 8GHz differential
- Used to drive the UCIe interface

### Reset

Chip reset is active high

Reset can be selected by a pin header jumper to use either button or FMC connection

### JTAG

Low priority low speed signal, route to pin header directly. Use off-board level shifter.

Follows the FT-LINK condensed pin map.

### UART

Configurable pin header selector to route to either 3.3V pin header or 1.2 V FMC.

Using the same level shifter design as Maveric.

### Serial TL

Configurable resistor bank to route to either FMC or debug header. The resistor selectors are by default all placed, so we can monitor FMC traffic through the pin header. 

If signal integrity is a concern, we can remove the pin header selectors manually.

### UCIE Config Bits

Configurable pin header jumper selector to connect to FMC. 

If manual control of the signal voltage is needed, need to use jumper cable to tie signals to either high or low. Since this is configured before chip bootup and will not change during the chip execution, this is fine.

### Chip ID Select

A pin header selector to tie signal high or low.

### DDR Debug

All DDR digital signals broke out to a pin header. This is only present for chip U1.


### FMC Pinout


| Signal                    | FMC Net Name  | FMC Pin | FPGA Pin (Nexys Video)  | Notes |
| ---                       | ---           | ---     | ---                     | ---   |
| serial_tl_clock           | LA_00_P_CC    | G6      |                      |       |
| serial_tl_in_valid        | LA_03_P       | G9      |                      |       |
| serial_tl_in_ready        | LA_08_P       | G12     |                      |       |
| serial_tl_in_bits\[0\]    | LA_12_P       | G15     |                      |       |
| serial_tl_out_valid       | LA_02_P       | H7      |                      |       |
| serial_tl_out_ready       | LA_04_P       | H10     |                      |       |
| serial_tl_out_bits\[0\]   | LA_07_P       | H13     |                      |       |
| uart_rx                   | LA_20_P       | G21     |                      | selectable |
| uart_tx                   | LA_20_N       | G22     |                      | selectable |
| reset                     | LA_25_P       | G27     |                      | selectable |
| ucie_sel_fmc              | LA_29_P       | G30     |                      | selectable, only present for U1 |
| ucie_sel_fmc              | LA_29_N       | G31     |                      | selectable, only present for U1 |


## PCB Layout

8 layer PCBs

| Index | Layer Name | Purpose                                      |
| ----- | ---------- | -------------------------------------------- |
| 1     | L1         | Core clocks, slow-speed interlayer signals   |
| 2     | L2         | GND plane                                    |
| 3     | L3         | C2C signal, serial TL, slow-speed interlayer |
| 4     | L4         | VDD_core U1                                  |
| 5     | L5         | VDD_IO trace + GND pour                      |
| 6     | L6         | DDR power + GND pour                         |
| 7     | L7         | VDD_core U2                                  |
| 8     | L8         | UCIE power trace + C2C signal + GND pour     |
| 9     | L9         | GND plane                                    |
| 10    | L10        | UCIE clock, slow-speed interlayer signals    |

GND: add stiching between ground layers

Stackup: JLC10121H-2116

![image](https://github.com/user-attachments/assets/1afafd02-04cb-4e4b-8178-765cd3bba34f)

Layout will be done in millimeters (mm)

Regarding JLC layout service: not optimal, since it's priced by pad count, and we have a lot of powers and grounds

![image](https://github.com/user-attachments/assets/86504560-fe81-4c28-8409-59f4a71c6305)


### Component Placement

FMC indentation is at the bottom, which matches the FPGA.

![image](https://github.com/user-attachments/assets/ad526316-984a-4c10-842a-c84461a6de1a)

![image](https://github.com/user-attachments/assets/da2ad535-89ee-487b-97ee-53b2d79084bb)



### Power

For core and IO power, wide trace on top layer to connect pins together, and then via down as much as possible

![image](https://github.com/user-attachments/assets/726bd001-fe69-4c2d-8e63-4aea626eed7e)

Decoupling capacitors at the bottom layer, with mechanical clearance to the backplate pattern.

![image](https://github.com/user-attachments/assets/65efc4c2-5b59-4c8d-a117-f64c5cb7385f)

VDD_IO net

![image](https://github.com/user-attachments/assets/d93ec7ea-30db-445e-bcfa-bfcb095e9b9b)





DDL_IBAS need a narrow trace to connect to pin

![image](https://github.com/user-attachments/assets/30298153-74fc-4614-93d2-c33a54c7e88c)


### DDR Routing

using calculated 50R trace, 0.186 mm, diff routing to SMA receivers

![image](https://github.com/user-attachments/assets/b5cc49c5-96ef-4be0-984f-30000e65402c)

Due to signal congestion, had to disconnect 1 VDD_IO pin and 2 GND pin.

![image](https://github.com/user-attachments/assets/702b4ce9-a479-4149-8861-3548e38a4119)

### System Clock Routing

SMA directly to pin, with 50R resistor placed close to socket.

![image](https://github.com/user-attachments/assets/f0595b78-fc05-4905-84dc-42db8225caab)

### C2C connect

need to use both L3 and L10 layer

![image](https://github.com/user-attachments/assets/8371a78b-92db-4ffa-8e30-910db2c93d4c)

### Via Stiching

Entire board is GND stiched with 4mm spacing vias.

### DRC Check

![image](https://github.com/user-attachments/assets/a9bc0c2f-f619-455b-8f68-efbeabc1f78f)

12 DRCs are due to banana connector silkscreen out of board, which is fine.

1 DRC is FMC connector silkscreen too close to the mechanical hole, which is fine.


## Feedback for future chips

Design the bumpmap / interposer with PCB routing in mind! Put high speed signals or nets that require wide traces around the edge of the pin map.


<!-- # FPGA Bringup Procedure

1. build program in `~/Desktop/chipyard/tests/` folder.

2. power on the chip and FPGA.

3. program the chip:

TSI baudrate defaults to be 115200


uart_tsi
```bash
./uart_tsi +tty=/dev/ttyUSB0 +cflush???=??????? ~/Desktop/chipyard/tests/hello.riscv 
```

pyuartsi

```bash
python -m pyuartsi --port /dev/ttyUSB0 --elf ~/Desktop/chipyard/tests/mt-hello.riscv --load --selfcheck --hart0_msip --fesvr --cflush_addr 0x02010200
```

Source code of pyuartsi is located at `~/Desktop/pytsi`

4. debugging

reading from chip scratchpad

```bash
python -m pyuartsi --port /dev/ttyUSB0 --init_read 0x08000000
```

writing to the chip scratchpad

```bash
python -m pyuartsi --port /dev/ttyUSB0 --init_write 0x08000000:0xdeadbeef
```

 -->


# Schematic Preliminary Review

## u2 & u1
LSB: 48_41
MSB: 49_40

Make a bigger header to accomodate obus MSB and LSB.
New button for jtag reset.
delete chip id select
