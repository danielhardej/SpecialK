void kernel_main() {
    char *video_memory = (char *)0xB8000;
    const char *message = "Hello, World!";
    int i = 0;

    while (message[i] != '\0') {
        video_memory[i * 2] = message[i];
        video_memory[i * 2 + 1] = 0x07; // Light grey on black background
        i++;
    }

    while (1) {
        // Halt the CPU
        // __asm__ __volatile__("hlt");
    }
}