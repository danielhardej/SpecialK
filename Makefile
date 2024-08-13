all: kernel.bin

kernel.o: kernel/kernel.cpp
	g++ -m32 -ffreestanding -O2 -Wall -Wextra -c kernel/kernel.cpp -o kernel/kernel.o

kernel.bin: kernel/kernel.o
	g++ -m32 -nostdlib -o kernel/kernel.bin kernel/kernel.o -Wl,-T,linker.ld

clean:
	rm -f kernel/*.o kernel/kernel.bin