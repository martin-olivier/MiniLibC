BITS 64
SECTION .text
global strcmp

strcmp:
xor rax, rax
xor rcx, rcx

loop:
cmp BYTE[rdi + rcx], 0
je noteq

cmp BYTE[rsi + rcx], 0
je noteq

mov r8b, BYTE[rsi + rcx]
cmp BYTE[rdi + rcx], r8b
jne noteq
inc rcx
jmp loop

noteq:
mov al, BYTE[rdi + rcx]
sub al, BYTE[rsi + rcx]
movsx rax, al
ret