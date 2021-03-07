BITS 64
SECTION .text
global strstr

strstr:
xor rcx, rcx                    ; i = 0
xor rax, rax   
xor r8, r8
xor r9, r9

cmp BYTE[rsi], 0
je endok

loop:                           ; main LOOP
cmp BYTE[rdi + rcx], 0          ; if (arg1[i] == '\0')
je endfail                      ; jump to endfail (return NULL)
mov r8b, BYTE[rdi + rcx]        ;
cmp BYTE[rsi], r8b              ; if (arg1[i] == arg2[0])
je try                          ; jump to try (arg2 LOOP a partir de arg1[i])
resume:
inc rcx                         ; i++
jmp loop                        ; goto main LOOP

try:
mov r8, 0                       ; j = 0
tryloop:
cmp BYTE[rsi + r8], 0           ; if (arg2[j] == '\0')
je endok                        ; return adress arg1[i]
mov r9, rdi
add r9, rcx
mov r10b, BYTE[r9 + r8]
cmp BYTE[rsi + r8], r10b        ; if (arg1[i + j] != arg2[j])
jne resume                      ; goto resume
inc r8                          ; j++
jmp tryloop

endok:
mov rax, rdi
add rax, rcx
ret

endfail:
mov rax, 0
ret