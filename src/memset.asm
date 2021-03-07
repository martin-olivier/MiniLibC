BITS 64
SECTION .text
global memset

memset:
xor rax, rax
xor rcx, rcx
mov r8, rdi

loop:
cmp rcx, rdx
jge end

mov BYTE[rdi], sil
inc rcx
inc rdi
jmp loop

end:
mov rax, r8
ret