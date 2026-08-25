# Password-Based Access Control System (PIC16F877A)

University lab project (Al-Azhar University, Gaza, supervised by Eng. Siraj
Sersawi) — a keypad/LCD-based access control system built around a
PIC16F877A microcontroller.

## How it works

The user enters a password on a 3×4 keypad; an LCD guides the interaction.
On a correct entry, a relay is switched on (e.g. to open a door or power a
220 VAC device). After **three failed attempts**, the system triggers a
buzzer and a red LED and locks itself.

## Highlights

- Circuit design and simulation in **Proteus** (PIC16F877A, 3×4 keypad, 16×2
  LCD, relay, buzzer, LEDs)
- Firmware in **MikroC**: password entry & comparison, LCD output, relay
  control, 3-attempt lockout with alarm
- Full **PCB layout** designed in Proteus
- Programmed to the microcontroller via a QL2006 programmer

## Repository structure

| Folder | Content |
|---|---|
| [`Code`](Code) | MikroC project & compiled firmware |
| [`Main-Project`](Main-Project) | Full lab report incl. schematic & PCB (PDF) |

## Related project

Also ported to a [Raspberry Pi 4 / Python implementation](https://github.com/MohammedAbedellatif/Security-System-by-Raspberry-pi-4).
