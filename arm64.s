.section .data
msg:    .asciz "Hello, ARM64!\n"

.section .text
.global _start
_start:
    mov x0, #1                // stdout
    adr x1, msg               // Address of msg
    mov x2, #14               // Length of msg
    mov x8, #64               // Syscall number: write
    svc #0                    // Call kernel

    mov x0, #0                // Exit code
    mov x8, #93               // Syscall number: exit
    svc #0                    // Call kernel

