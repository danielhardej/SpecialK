# SpecialK

I'm writing a Linux-like kernel from scratch!

The code in this project will create a simple kernel that prints "Hello, World!" to the screen. This example is highly simplified, and does not include many features of a full-fledged operating system kernel like Linux, but it provides a starting point for understanding how kernels are built and executed.

## Files

- `boot.asm`: This is the assembly code that is run when the kernel is first loaded. It sets up the stack, calls the kernel's `main` function, and then halts the CPU.
- `kernel.c`: This is the C code that is run when the kernel is first loaded. It prints "Hello, World!" to the screen.
- `linker.ld`: This is the linker script that tells the linker how to combine the assembly and C code into a single binary file.
- `Makefile`: This is the makefile that tells the build system how to build the kernel.

## How to build

```bash
$ make
```

## How to run

Use an emulator, like QEMU, to run the kernel:

```bash
qemu-system-i386 -drive format=raw,file=os-image
```