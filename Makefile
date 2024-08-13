CFLAGS=-m32 -ffreestanding -O2 -Wall -Wextra
LDFLAGS=-m elf_i386 -T linker.ld

all: os-image

os-image: boot/boot.bin kernel/kernel.bin
	@echo "Creating OS image..."
	cat $^ > os-image

boot/boot.bin: boot/boot.asm
	@echo "Assembling bootloader..."
	nasm -f elf boot/boot.asm -o boot/boot.o

kernel/kernel.bin: kernel/kernel.o
	@echo "Linking kernel..."
	ld $(LDFLAGS) -o $@ $<

kernel/kernel.o: kernel/kernel.c
	@echo "Compiling kernel..."
	gcc $(CFLAGS) -c $< -o $@

clean:
	@echo "Cleaning up..."
	rm -f boot/boot.bin kernel/kernel.o kernel/kernel.bin os-image