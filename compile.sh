nasm -gdwarf -f elf32 getchar.s -o getchar.o
nasm -gdwarf -f elf32 testGetChar.s -o testGetChar.o
ld -m elf_i386 testGetChar.o getchar.o -o testGetChar
