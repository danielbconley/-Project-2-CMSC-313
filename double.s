.section .data
    input_fmt:   .asciz "%ld"
    output_fmt:  .asciz "The double is: %ld\n"

.section .bss
    .lcomm num, 8           

.section .text
    .globl main

main:
    pushq %rbp
    movq %rsp, %rbp

    leaq input_fmt(%rip), %rdi
    leaq num(%rip), %rsi
    xorq %rax, %rax        
    call scanf

    movq num(%rip), %rax    
    addq %rax, %rax         

    leaq output_fmt(%rip), %rdi
    movq %rax, %rsi
    xorq %rax, %rax
    call printf

    movq $0, %rax         
    leave
    ret