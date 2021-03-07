BITS 64
SECTION .text
global strcasecmp

strcasecmp:
xor rax, rax                ; return = 0
xor rcx, rcx                ; i = 0

loop:
jmp toLowerArg1
resumeArg1:

jmp toLowerArg2
resumeArg2:

cmp BYTE[rdi + rcx], 0      ; if (arg1[] == \0)
je end                      ; jump to end

cmp BYTE[rsi + rcx], 0      ; if (arg2[] == \0)
je end                      ; jump to end

cmp r8b, r9b
jne end
inc rcx
jmp loop

end:
mov al, r8b
sub al, r9b
movsx rax, al
ret

changeArg1:
add r8b, 32
jmp resumeArg1

isUpthanAarg1:
cmp r8b, 90
jle changeArg1
jmp resumeArg1

toLowerArg1:
mov r8b, BYTE[rdi + rcx]
cmp r8b, 65
jge isUpthanAarg1
jmp resumeArg1

changeArg2:
add r9b, 32
jmp resumeArg2

isUpthanAarg2:
cmp r9b, 90
jle changeArg2
jmp resumeArg2

toLowerArg2:
mov r9b, BYTE[rsi + rcx]
cmp r9b, 65
jge isUpthanAarg2
jmp resumeArg2