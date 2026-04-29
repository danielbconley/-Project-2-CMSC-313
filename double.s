# Name: Daniel Conley
# Project: Project 2
# Description: Reads a 64-bit integer from stdin, doubles it, and prints the result.
#
# How to execute on gl-server:
#   1. gcc -no-pie double.s -o double
#   2. ./double

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

    # Step 1: Read number from stdin
    leaq input_fmt(%rip), %rdi
    leaq num(%rip), %rsi
    xorq %rax, %rax        
    call scanf

    # Step 2: Double the value
    movq num(%rip), %rax    
    addq %rax, %rax         

    # Step 3: Output the result
    leaq output_fmt(%rip), %rdi
    movq %rax, %rsi
    xorq %rax, %rax
    call printf

    movq $0, %rax         
    leave
    ret
