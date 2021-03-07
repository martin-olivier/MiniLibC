BITS 64
SECTION .text
global strpbrk

strpbrk:
xor rax, rax        ; return = 0
xor rcx, rcx        ; i = 0

loop:               ; main loop
cmp BYTE[rdi], 0    ; if (arg1[] == '\0')
je returnerr        ; jmp -> return NULL

mov rcx, rsi        ; i = arg2
jmp loop2           ; goto loop2
resume:

inc rdi             ; arg1++
jmp loop            ; goto loop

loop2:
cmp BYTE[rcx], 0    ; if (tmp_arg2[] == '\0')
je resume           ; goto resume
mov r8b, BYTE[rdi]
cmp r8b, BYTE[rcx]  ; if (arg1[] == tmp_arg2[])
je return           ; goto return
inc rcx             ; tmp_arg2++
jmp loop2           ; goto loop2

return:
mov rax, rdi        ; return actual arg1 pos occurence
ret

returnerr:
mov rax, 0          ; return nil NULL
ret