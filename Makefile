CFLAGS=-m32 -ffreestanding -O2 -Wall -Wextra
LDFLAGS=-m elf_i386 -T linker.ld

all: os-image

os-image: boot/boot.bin kernel/kernel.bin
    cat $^ > os-image

boot/boot.bin: boot/boot.asm
    nasm -f bin $< -o $@

kernel/kernel.bin: kernel/kernel.o
    ld $(LDFLAGS) -o $@ $<

kernel/kernel.o: kernel/kernel.c
    gcc $(CFLAGS) -c $< -o $@

clean:
    rm -f boot/boot.bin kernel/kernel.o kernel/kernel.bin os-image