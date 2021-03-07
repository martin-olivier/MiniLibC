BITS 64
SECTION .text
global strchr

strchr:
xor rax, rax

loop:
cmp BYTE[rdi], sil
je retur
cmp BYTE[rdi], 0
je returerr

inc rdi
jmp loop

retur:
mov rax, rdi
ret

returerr:
mov rax, 0
ret