.global _start

.section .data
    message:
    # Beginning of the string literal "Hello world\n\0" is at the memory location of message
    .ascii "Hello world\n\0"

.section .text
# Function Two
func_two:
    # Prologue
    pushq   %rbp        # Save old %rbp
    movq    %rsp, %rbp  # Base pointer is set to the address of stack pointer

    # Write hello world to stdout
    movl    $1, %eax
    movl    $1, %edi
    leaq    message(%rip), %rsi
    movl    $13, %edx
    syscall
    
    # Epilogue
    movq    %rbp, %rsp  # Drop the stack pointer to the current base pointer
    popq    %rbp        # Pops the base pointer off the stack, so it is restored to its value before the prologue.
    popq    %rax
    jmp     *%rax       # Jump to the return address

# Function One
func_one:
    # Prologue
    pushq   %rbp        # Save old %rbp
    movq    %rsp, %rbp  # Base pointer is set to the address of stack pointer
    subq    $8, %rsp    # Allocate stack space for return address

    # Call func_two
    leaq    return_from_two(%rip), %rax     # Load return address
    pushq   %rax                            # Push return address onto stack
    jmp     func_two                        # Jump to function
    return_from_two:

    # Epilogue
    movq    %rbp, %rsp  # Drop the stack pointer to the current base pointer
    popq    %rbp        # Restore earlier base pointer
    popq    %rax        # Pops the base pointer off the stack, so it is restored to its value before the prologue.
    jmp     *%rax       # Jump to the return address


_start:
    # Call func_one
    leaq    return_from_one(%rip), %rax 
    pushq   %rax                          # Push return address onto stack
    jmp     func_one                      # Jump to function
    return_from_one:

    # Exit syscall
    movq $60, %rax   # syscall: exit
    xorq %rdi, %rdi  # status: 0
    syscall          # call kernel
