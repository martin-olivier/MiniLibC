BITS 64
SECTION .text
global strcspn

strcspn:
xor rax, rax
xor rcx, rcx
xor r8, r8
xor r9, r9

mainloop:

cmp BYTE[rdi], 0
je end
jmp scan
resume:
inc rdi
jmp mainloop

resumeINC:
inc rcx
jmp resume

scan:
xor r8, r8
mov r9b, BYTE[rdi]
scanloop:
cmp BYTE[rsi + r8], 0
je resumeINC
cmp r9b, BYTE[rsi + r8]
je end
inc r8
jmp scanloop

end:
mov rax, rcx
ret