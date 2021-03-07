BITS 64
SECTION .text
global memcpy

memcpy:
xor rax, rax
xor rcx, rcx
mov r8, rdi

loop:
cmp rcx, rdx
je end

mov r9b, BYTE[rsi]
mov BYTE[rdi], r9b
inc rcx
inc rdi
inc rsi
jmp loop

end:
mov rax, r8
ret