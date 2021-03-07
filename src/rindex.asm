BITS 64
SECTION .text
global rindex

rindex:
xor rax, rax
mov r8, rdi

loop:
cmp BYTE[rdi], 0
je backloop
inc rdi
jmp loop

backloop:
cmp rdi, r8
je returerr
cmp BYTE[rdi], sil
je retur
dec rdi
jmp backloop

retur:
mov rax, rdi
ret

returerr:
cmp BYTE[rdi], sil
je retur
mov rax, 0
ret