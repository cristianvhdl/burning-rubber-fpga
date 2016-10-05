# Burning Rubber
Nexys 3 Spartan 6 

# Memory Layout
With its 16-bit address bus, the CPU sees 64K of memory. This is divided into two 4096-byte blocks. Block 1 contains the stack, I/O ports, 
and a scratch RAM area. It is the “common” block, and is always present in the CPU’s address space no matter what is happening with bank 
switching. In contrast, block 0 is a swappable memory area, and can be mapped to any bank in physical memory.

Physical memory is 64K, and is divided equally between ROM and RAM. The 64K physical memory space is partitioned into 16 banks of 4096 
bytes each.  Any bank can be mapped into block 0. Bank 8 is always mapped into block 1, the common block.

The bank select register is part of the memory-mapped I/O ports in common memory. To swap a bank, the CPU only needs to write the new bank 
number to the appropriate address.

This may all seem pretty simple, but take a minute to consider some of the implications:

1.  Upon reset, bank 0 is mapped to block 0. That puts 4096 bytes of ROM, ??? bytes of RAM, the I/O ports, and the stack all in the CPU’s 
address space. That’s plenty for many small programs, and means they won’t have to bother about bank switching at all.
2.  Larger programs (lots of program code) can be accommodated by bank switching code segments in/out of block 0, all operating on common 
data in block 1.  
3.  Programs operating on large data structures can copy some bank-switching helper code to block 1, then swap additional RAM 
banks in/out of block 0.  
4.  Arguments can be passed on the stack to ROM helper routines in other banks, because the stack is in common 
memory.  
5.  All of ROM is addressable, with no holes. This makes storing images, audio samples, and other data in ROM much easier.
6.  There is no difference in handling between ROM and RAM banks. A program running entirely from RAM works just like one whose code is in 
ROM
