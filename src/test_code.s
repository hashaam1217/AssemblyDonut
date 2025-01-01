//
// Assembler program to print "Hello World!"
// to stdout.
//
// X0-X2 - parameters to Unix system calls
// X16 - Mach System Call function number
//

.global _start   // Provide program starting address to linker
.align 4  // Make sure everything is aligned properly

// Setup the parameters to print hello world
// and then call the Kernel to do it.
_start:
 sub sp, sp, #16
 mov x5, #4
 str x5, [sp]

 mov X0, #1  // 1 = StdOut
 adr X1, helloworld  // string to print
 mov X2, #14      // length of our string
 mov X16, #4  // Unix write system call
 svc #0x80  // Call kernel to output the string

 mov X0, #1  // 1 = StdOut
 add X4, sp, #32
 mov X1, X4 // Move StackPointer to be printed
 mov X2, #1      // length of our string
 mov X16, #4  // Unix write system call
 svc #0x80  // Call kernel to output the string

 mov X0, #1  // 1 = StdOut
 mov X1, sp  // Move stack pointer to X1
 // adr X1, emptyscreen // string to print
 mov X2, #13      // length of our string
 mov X16, #4  // Unix write system call
 svc #0x80  // Call kernel to output the string

number_print:


// Setup the parameters to exit the program
// and then call the kernel to do it.
 mov     X0, #0  // Use 0 return code
 mov     X16, #1  // System call number 1 terminates this program
 svc     #0x80  // Call kernel to terminate the program

helloworld:      .ascii  "Hello, World!\n"
// emptyscreen:     .ascii  "\e[H\e[2J"
emptyscreen:     .ascii  "\033[H\033[2J"
