# apple2memtest

To assemble and run the code, you'll need an assembler such as asm6502 and an Apple II emulator or a real Apple II machine. Follow these steps:

Save the code above in a file called memtest.asm.

Assemble the code using asm6502 or a similar assembler:

asm6502 memtest.asm -l memtest.lst -o memtest.bin

Load the resulting binary file memtest.bin into the Apple II emulator or onto a real Apple II machine.

In the emulator or machine, type:

CALL -151

to enter the Apple II monitor.

Load the binary into memory at address $300:

300: <memtest.bin

Run the assembled code:

300G

The memory test will run, and if any errors are found, they will be displayed on the screen.
