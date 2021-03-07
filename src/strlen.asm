BITS 64
SECTION .text
global strlen

strlen:
xor rax, rax

loop:
cmp BYTE[rdi + rax], 0
je endl
inc rax
jmp loop

endl:
ret