[BITS 16]
[ORG 0x7C00]

start:
    ; Set up the stack
    cli
    xor ax, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    ; Switch to protected mode
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; Far jump to flush the prefetch queue
    jmp 0x08:protected_mode

[BITS 32]
protected_mode:
    ; Set up data segments
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    ; Call the kernel
    call kernel_main

hang:
    hlt
    jmp hang

gdt_start:
    ; Null descriptor
    dq 0x0000000000000000
    ; Code segment descriptor
    dq 0x00CF9A000000FFFF
    ; Data segment descriptor
    dq 0x00CF92000000FFFF
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

times 510 - ($ - $$) db 0
dw 0xAA55