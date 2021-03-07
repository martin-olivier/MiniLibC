BITS 64
SECTION .text
global memmove

memmove:
xor rcx, rcx

cmp rdi, rsi
jle loop

jmp loopinv

loop:
cmp rdx, 0
je end

mov r9b, BYTE[rsi + rcx]
mov BYTE[rdi + rcx], r9b
dec rdx
inc rcx
jmp loop

loopinv:
cmp rdx, 0
je end

mov r9b, BYTE[rsi + rdx - 1]
mov BYTE[rdi + rdx - 1], r9b
dec rdx
jmp loopinv

end:
mov rax, rdi
ret